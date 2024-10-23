import 'dart:io';

import 'package:almohagerlms/config/themes/colors.dart';
import 'package:almohagerlms/core/components/screen_status/error_widget.dart';
import 'package:almohagerlms/core/components/screen_status/loading_widget.dart';
import 'package:almohagerlms/core/components/widgets.dart';
import 'package:almohagerlms/core/utils/app_const.dart';
import 'package:almohagerlms/core/utils/most_used_functions.dart';
import 'package:almohagerlms/features/web_view/web_view_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<ScaffoldState> scaffoldKeyShared = GlobalKey<ScaffoldState>();
late final InAppWebViewController? webViewControllerShared;

/// load url ====>>>
void loadUrlReuse(String url) {
  webViewControllerShared!.loadUrl(
    urlRequest: URLRequest(
      url: WebUri(url),
    ),
  );
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    _setPullRefresh();
    super.initState();
  }

  @override
  void dispose() {
    scaffoldKeyShared.currentState!.dispose();
    super.dispose();
  }

  bool isLoading = true;
  bool isError = false;
  String currentUrlValue = '';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) async {
        debugPrint('onPopInvoked: $value');
        if (await webViewControllerShared!.canGoBack()) {
          webViewControllerShared!.goBack();
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        key: scaffoldKeyShared,
        drawer: WebViewDrawer(currentUrl: currentUrlValue),
        appBar: AppBar(
          title: const AppLogo(),
          actions: [
            // notification icon
            IconButton(
              onPressed: () {
                loadUrlReuse(AppConst.notifications);
              },
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(AppConst.webUrl),
              ),
              initialSettings: InAppWebViewSettings(
                mediaPlaybackRequiresUserGesture: false,
                allowsInlineMediaPlayback: true,
                useShouldOverrideUrlLoading: false,
                transparentBackground: true,
              ),
              onConsoleMessage: (
                InAppWebViewController controller,
                ConsoleMessage consoleMessage,
              ) {
                debugPrint('Console Message: ${consoleMessage.message}');
              },
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (InAppWebViewController controller) {
                webViewControllerShared = controller;
              },
              onLoadStart: (controller, url) {
                setCurrentUrl(url?.path);
                debugPrint('onLoadStart: $currentUrlValue');
              },
              onLoadStop: onLoadStop,
              onReceivedError: onLoadError,
              onEnterFullscreen: (controller) async {
                if (MostUsedFunctions.isTablet) return;
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              },
              onExitFullscreen: (controller) async {
                if (MostUsedFunctions.isTablet) return;
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              },
            ),
            if (isLoading == true)
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: double.infinity,
                height: double.infinity,
                child: const LoadingWidget(),
              ),
            if (isError == true)
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: double.infinity,
                height: double.infinity,
                child: ErrorBody(
                  onPressed: () async {
                    _setLoadState(true);
                    await webViewControllerShared!.reload();
                    _setErrorState(false);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void onPageStart(String url) {
    setCurrentUrl(url);

    _setLoadState(true);
    debugPrint('Page started loading: $url');
  }

  void _setPullRefresh() {
    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(color: AppColors.cPrimary),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                await webViewControllerShared?.reload();
                debugPrint('reload android');
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewControllerShared?.loadUrl(
                  urlRequest: URLRequest(
                    url: await webViewControllerShared?.getUrl(),
                  ),
                );
              }
            },
          );
  }

  void _setLoadState(bool state) {
    isError = false;
    isLoading = state;
    setState(() {});
  }

  void _setErrorState(bool state) {
    isError = state;
    setState(() {});
  }

  void onLoadStop(
    InAppWebViewController controller,
    Uri? url,
  ) async {
    setCurrentUrl(url?.path);

    // Log the current URL
    debugPrint('Current URL: $currentUrlValue');

    _setLoadState(false);
    pullToRefreshController?.endRefreshing();
  }

  void onLoadError(
    InAppWebViewController controller,
    WebResourceRequest request,
    WebResourceError error,
  ) {
    _setLoadState(false);
  }

  void setCurrentUrl(String? url) {
    final urlWithoutSlash = url?.substring(1) ?? '';
    currentUrlValue = '${AppConst.webUrl}$urlWithoutSlash';
    debugPrint('setCurrentUrl: $currentUrlValue');
  }

  Future<NavigationActionPolicy?> shouldOverrideUrlLoading(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  ) async {
    final uri = navigationAction.request.url!;
    debugPrint('containsSocial ${uri.uriValue}');

    if (MostUsedFunctions.isContainsSocial(uri.host) ||
        MostUsedFunctions.isContainsSocial(uri.uriValue.toString())) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return NavigationActionPolicy.CANCEL;
    } // if blank page
    else if (uri.uriValue.toString().contains('about:blank')) {
      return NavigationActionPolicy.CANCEL;
    }
    _setLoadState(true);
    return NavigationActionPolicy.ALLOW;
  }
}
