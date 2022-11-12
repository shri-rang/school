import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:schoolman/Colors.dart';
import 'package:schoolman/Screens/CircularScreen/Controller/CircularController.dart';

class CircularDetails extends StatefulWidget {
  const CircularDetails({Key? key}) : super(key: key);

  @override
  State<CircularDetails> createState() => _CircularDetailsState();
}

class _CircularDetailsState extends State<CircularDetails> {
  final circularCnt = Get.put(CircularController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 19, left: 18, right: 18),
        child: Container(
          width: double.infinity,
          height: 180,
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
                circularCnt.circularDetailModel.value.data!.title!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Gap(18),
              Text(
                circularCnt.circularDetailModel.value.data!.message!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Html(
              //     data: circularCnt.circularDetailModel.value.data!.message,
              //   ),
              // ),
              Gap(30),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    circularCnt.circularDetailModel.value.data!.timestamp
                        .toString()
                        .split(" ")
                        .first,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
