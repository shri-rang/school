import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:schoolman/Colors.dart';
import 'package:schoolman/Screens/CircularScreen/Controller/CircularController.dart';
import 'package:schoolman/Screens/CircularScreen/View/CircularScreenDetails.dart';

class CircularScreen extends StatefulWidget {
  const CircularScreen({Key? key}) : super(key: key);

  @override
  State<CircularScreen> createState() => _CircularScreenState();
}

class _CircularScreenState extends State<CircularScreen> {
  final circularCnt = Get.put(CircularController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              height: 19,
            ),
            Obx(
              () => circularCnt.circularModel.value.data == null
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          color: bg,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: circularCnt.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await circularCnt.circularDetail(
                              circularCnt.data[index].composeId!,
                            );
                            Get.to(CircularDetails());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                                color: accentbg,
                                boxShadow: [
                                  BoxShadow(
                                      color: bg,
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(0, 8)),
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: [
                                Gap(10),
                                Text(
                                  circularCnt.data[index].title!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Text(
                                  circularCnt.data[index].message!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      circularCnt.data[index].timestamp!
                                          .toString()
                                          .split(" ")
                                          .first,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
