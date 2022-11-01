import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:schoolman/Model/LoginModel.dart';
import 'package:schoolman/Model/SchoolModel.dart';
import 'package:schoolman/Screens/HomeScreen/View/HomeScreen.dart';
import 'package:schoolman/Services/LoginService/LoginService.dart';
import 'package:schoolman/contant/constant.dart';
import 'package:schoolman/utility.dart';

class LoginController extends GetxController {
  Rx<SchoolModel> schoolModel = SchoolModel().obs;
  final loginService = LoginService();

  @override
  void onInit() async {
    super.onInit();
    schoolInfo();
  }

  Future<void> loginUser(String emailId, String password) async {
    // if (!isValid) {
    //   print('not valid form');
    //   Get.back();
    //   return;
    // } else {
    // loginFormKey.currentState!.save();

    final response = await loginService.loginUser(
      emailId,
      password,
    );
    if (response == " ") {
      Get.back();
      customSnackBar(
          Constants.connectionFailed, Constants.checkInternetConnection);
    } else if (response is http.Response) {
      if (response.statusCode == 404) {
        print(response.body.toString());
        Map mapdata = jsonDecode(response.body.toString());
        Get.back();
        customSnackBar(Constants.failed, mapdata['message'][0]);
      } else if (response.statusCode == 500) {
        Map mapdata = jsonDecode(response.body.toString());
        Get.back();
        customSnackBar(
            Constants.connectionFailed, Constants.checkServerConnection);
      } else if (response.statusCode == 201) {
        Map mapdata = jsonDecode(response.body.toString());
        if (mapdata['success'] == '0') {
          Get.back(closeOverlays: true);
          customSnackBar(Constants.pleaseTryAgain, mapdata['message']);
        } else {
          final loginModel = loginModelFromJson(response.body);

          saveToken(loginModel.data!.token!);

          // Get.back();
          // saveToken(mapdata['data']['remember_token']);
          Get.offAll(HomeScreen());
        }
        print(mapdata);
      }
    }
  }

  Future<void> schoolInfo() async {
    // if (!isValid) {
    //   print('not valid form');
    //   Get.back();
    //   return;
    // } else {
    // loginFormKey.currentState!.save();

    final response = await loginService.schoolInfo();
    if (response == " ") {
      Get.back();
      customSnackBar(
          Constants.connectionFailed, Constants.checkInternetConnection);
    } else if (response is http.Response) {
      if (response.statusCode == 404) {
        print(response.body.toString());
        Map mapdata = jsonDecode(response.body.toString());
        Get.back();
        customSnackBar(Constants.failed, mapdata['message'][0]);
      } else if (response.statusCode == 500) {
        Map mapdata = jsonDecode(response.body.toString());
        Get.back();
        customSnackBar(
            Constants.connectionFailed, Constants.checkServerConnection);
      } else if (response.statusCode == 201) {
        Map mapdata = jsonDecode(response.body.toString());
        if (mapdata['success'] == '0') {
          Get.back(closeOverlays: true);
          customSnackBar(Constants.pleaseTryAgain, mapdata['message']);
        } else {
          schoolModel.value = schoolModelFromJson(response.body);

          // saveToken(loginModel.data!.token!);

          // Get.back();
          // saveToken(mapdata['data']['remember_token']);
          // Get.offAll(HomeScreen());
        }
        print(mapdata);
      }
    }
  }
}
