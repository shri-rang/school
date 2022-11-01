import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolman/Screens/LoginScreen/View/LoginScreen.dart';
import 'package:schoolman/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> image = [
    "https://development.erpsofts.com/public/asset/icon/student-details.png",
    "https://development.erpsofts.com/public/asset/icon/attendance.jpg",
    "https://development.erpsofts.com/public/asset/icon/fees.png",
    "https://development.erpsofts.com/public/asset/icon/circular.png",
    "https://development.erpsofts.com/public/asset/icon/homework.webp",
    "https://development.erpsofts.com/public/asset/icon/school-website.jpg",
    "https://development.erpsofts.com/public/asset/icon/change-password.png",
    "https://development.erpsofts.com/public/asset/icon/help.png"
  ];

  List<String> tile = [
    "Student Details",
    "Attendance sheet",
    "Fees",
    "Circular",
    "Assignment",
    "School Website",
    "Change Password",
    "Need Help?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          // IconButton(
          //     onPressed: () async {
          //       var topne = await getToken();
          //       print(topne);
          //     },
          // icon: Icon(Icons.abc)),
          IconButton(
              onPressed: () {
                deleteToken();
                Get.offAll(LoginScreen());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          AppBar(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: Get.height / 1.5,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: tile.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(19)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      borderOnForeground: true,
                      semanticContainer: true,
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 19,
                          ),
                          Image.network(
                            image[index],
                            height: 60,
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            tile[index],
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
