import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolman/Colors.dart';
import 'package:schoolman/Screens/Profile/Controller.dart/ProfileController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();
  File? profile;

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => profileController.profileModel.value.photo == null
              ? 
              Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: bg,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Profile Picture",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: profile == null
                                    ?
                                    //    FileImage(File(profile.path))
                                    //
                                    CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            profileController
                                                .profileModel.value.photo!),
                                      )
                                    : CircleAvatar(
                                        backgroundImage: FileImage(profile!),
                                        //
                                      )),
                          ),
                          Positioned(
                              left: 210,
                              bottom: 1,
                              //  left: MediaQuery.of(context).size.width/2.4,
                              //  top: 200,
                              //  top:MediaQuery.of(context).size.height/7 ,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                    // style: ElevatedButton.styleFrom(
                                    //   backgroundColor: Colors.blue
                                    // ),

                                    iconSize: 20,
                                    onPressed: () {
                                      _showMyDialog();

                                      // picker.pickImage(source: ImageSource.camera );
                                    },
                                    icon: Icon(Icons.edit)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileWidget("Name",
                          profileController.profileModel.value.data!.name!),
                      profileWidget(
                          "Father Name",
                          profileController
                              .profileModel.value.data!.fatherName!),
                      profileWidget(
                          "Mother Name",
                          profileController
                              .profileModel.value.data!.motherName!),
                      profileWidget(
                          "Date of Birth",
                          profileController.profileModel.value.data!.dob!
                              .toString()
                              .split(" ")
                              .first),
                      profileWidget("Gender",
                          profileController.profileModel.value.data!.gender!),
                      profileWidget(
                          "Nationality",
                          profileController
                              .profileModel.value.data!.nationality!),
                      profileWidget("Adhaar No",
                          profileController.profileModel.value.data!.aadharNo!),
                      profileWidget("Email",
                          profileController.profileModel.value.data!.email!),
                      profileWidget("Phone No",
                          profileController.profileModel.value.data!.phoneNo!),
                      profileWidget(
                          "Father Profession",
                          profileController
                              .profileModel.value.data!.fatherProfession!),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Select Profile')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                IconButton(
                    iconSize: 70,
                    color: Colors.blue,
                    onPressed: () async {
                      var image =
                          await picker.pickImage(source: ImageSource.camera);

                      profile = File(image!.path);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.camera_alt)),
                IconButton(
                    iconSize: 70,
                    color: Colors.blue,
                    onPressed: () async {
                      var image =
                          await picker.pickImage(source: ImageSource.gallery);

                      profile = File(image!.path);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.image)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  profileWidget(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headName(title),
        SizedBox(
          height: 7,
        ),
        subHeader(subtitle),
        Divider(
          thickness: 1.5,
        )
      ],
    );
  }

  headName(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  subHeader(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(color: Colors.black, fontSize: 18),
    );
  }
}
