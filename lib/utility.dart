import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> saveToken(String accessToken) async {
  final box = GetStorage();
  box.write('accesstoken', accessToken);
}

Future<String?> getToken() async {
  final box = GetStorage();
  return box.read('accesstoken');
}

Future<void> deleteToken() async {
  final box = GetStorage();
  return box.remove('accesstoken');
}

Future<void> saveStdId(String accessToken) async {
  final box = GetStorage();
  box.write('stdid', accessToken);
}

Future<String?> getStdId() async {
  final box = GetStorage();
  return box.read('stdid');
}

Future<void> deleteStdId() async {
  final box = GetStorage();
  return box.remove('stdid');
}

customSnackBar(title, message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
  );
}
