import 'package:almohagerlms/core/storage/main_hive_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_const.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  // change theme mode
  static bool isDark = false;

  void changeThemeMode() async {
    isDark = !isDark;
    await MainHiveBox.putValue(AppConst.isDarkBox, isDark);
    emit(AppChangeThemeMode());
  }

  // change language
  Future<void> changeLanguage(
    BuildContext context,
    String languageCode,
  ) async {
    await EasyLocalization.of(context)!.setLocale(Locale(languageCode));
    emit(AppChangeLanguage());
  }
}
