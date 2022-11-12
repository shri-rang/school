import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:schoolman/Colors.dart';
import 'package:schoolman/Screens/LoginScreen/loginController/LoginController.dart';
import 'package:schoolman/widgets/Widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());

  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Card(
            child: Form(
              key: loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    Gap(30),
                    Obx(
                      () => loginController.schoolModel.value.logo != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  loginController.schoolModel.value.logo!,
                                  height: 30,
                                  width: 30,
                                ),
                                Text(loginController
                                    .schoolModel.value.data!.name!),
                              ],
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    textField(nameController, TextInputType.name,
                        (String? value) {
                      if (value!.isEmpty) {
                        return "Provide First Name";
                      }
                      return null;
                    }, "Username"),
                    Gap(10),
                    textField(passController, TextInputType.name,
                        (String? value) {
                      if (value!.length < 8) {
                        return "Password Should Be Minimum 3 Characters";
                      }
                      return null;
                    }, "Password"),
                    Gap(19),
                    Container(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: bg),
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              dai();
                              await loginController.loginUser(
                                  nameController.text, passController.text);
                            }
                          },
                          child: Text("Submit")),
                    ),
                    Gap(19),
                    TextButton(
                        onPressed: () {}, child: Text("Forgot Password?")),
                    Gap(19),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  dai() {
    Get.dialog(Center(
      child: Container(
        child: CircularProgressIndicator(
          color: bg,
          backgroundColor: accentbg,
        ),
      ),
    ));
  }
}
