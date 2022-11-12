import 'dart:convert';

import 'package:get/get.dart';
import 'package:schoolman/Services/Attendance/AttendanceService.dart';
import 'package:schoolman/contant/constant.dart';
import 'package:schoolman/utility.dart';
import 'package:http/http.dart' as http;
import '../../../Model/AttendanceModel.dart';

class AttendanceController extends GetxController {
  String? token;
  RxList<Datum> data = <Datum>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    token = await getToken();
    // var id = await getStdId();
    // profile(id!);
    await attendance();
  }

  final attendanceService = AttendanceService();

  // Rx<CircularModel> circularModel = CircularModel().obs;

  Future<void> attendance() async {
    // if (!isValid) {
    //   print('not valid form');
    //   Get.back();
    //   return;
    // } else {
    // loginFormKey.currentState!.save();

    final response = await attendanceService.attendance(token!);
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

          // final circularModel = circularModelFromJson(response.body);
          final attendanceModel = attendanceModelFromJson(response.body);
          data.addAll(attendanceModel.data!);
          // schoolModel.value = schoolModelFromJson(response.body);
          // profileModel.value = profileModelFromJson(response.body);
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
