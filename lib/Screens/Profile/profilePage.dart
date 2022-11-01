import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();
  File? profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              backgroundImage: AssetImage('assets/profile.jpg'),
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
            profileWidget(),
            profileWidget(),
            profileWidget(),
            profileWidget(),
            profileWidget(),
          ],
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

  profileWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headName(),
        SizedBox(
          height: 7,
        ),
        subHeader(),
        Divider(
          thickness: 1.5,
        )
      ],
    );
  }

  headName() {
    return Text(
      "Father Name",
      style: TextStyle(
          color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  subHeader() {
    return Text(
      "Amit",
      style: TextStyle(color: Colors.black, fontSize: 18),
    );
  }
}
