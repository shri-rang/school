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

customSnackBar(title, message) {
  Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,);
}