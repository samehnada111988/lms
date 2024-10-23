import 'package:permission_handler/permission_handler.dart';

class CheckAppPermissions {
  // request all permissions ====>>>
  static Future<bool> requestAllPermissions() async {
    final PermissionStatus microphone = await Permission.microphone.request();
    final PermissionStatus storage = await Permission.storage.request();
    final PermissionStatus photos = await Permission.photos.request();
    final PermissionStatus camera = await Permission.camera.request();

    if (microphone.isGranted &&
            storage.isGranted &&
            camera.isGranted &&
            photos.isGranted
        // && notification.isGranted
        ) {
      return true;
    } else {
      return false;
    }
  }
}
