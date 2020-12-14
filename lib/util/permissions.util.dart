import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission() async {
  Map<PermissionGroup, PermissionStatus> map = await new PermissionHandler()
      .requestPermissions(
      [PermissionGroup.storage, PermissionGroup.microphone]);
  print(map[PermissionGroup.microphone]);
  return map[PermissionGroup.microphone] == PermissionStatus.granted;
}
