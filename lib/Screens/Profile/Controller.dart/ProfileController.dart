import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:schoolman/Model/ProfileModel.dart';
import 'package:schoolman/Screens/LoginScreen/loginController/LoginController.dart';
import 'package:schoolman/Services/ProfileService/ProfileService.dart';
import 'package:schoolman/contant/constant.dart';
import 'package:schoolman/utility.dart';

class ProfileController extends GetxController {
  String? token;

  final loginController = Get.put(LoginController());

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    token = await getToken();
    var id = await getStdId();
    profile(id!);
  }

  final profileService = ProfileService();

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  Future<void> profile(String stdid) async {
    // if (!isValid) {
    //   print('not valid form');
    //   Get.back();
    //   return;
    // } else {
    // loginFormKey.currentState!.save();

    final response = await profileService.profile(token!, stdid);
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
          print(response.body);
          // schoolModel.value = schoolModelFromJson(response.body);
          profileModel.value = profileModelFromJson(response.body);
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
