import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsUtil {
  static Future<bool> checkRecordingPermission() async {
    final permissions = [PermissionGroup.storage, PermissionGroup.microphone];
    Map<PermissionGroup, PermissionStatus> map =
        await PermissionHandler().requestPermissions(permissions);
    return map[PermissionGroup.microphone] == PermissionStatus.granted &&
        map[PermissionGroup.storage] == PermissionStatus.granted;
  }
}
