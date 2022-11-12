import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolman/Screens/Attendance/Controller/AttendanceController.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            locale: 'en_US',
            weekendDays: [DateTime.sunday],
            daysOfWeekStyle: DaysOfWeekStyle(),
            // calendarController: _calendarController,
            headerStyle: HeaderStyle(),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              // holidayStyle: TextStyle().copyWith(color: greyColor),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: getDayColor(day),
                        child: Text(day.day.toString()),
                      ),
                    ));

                //  Container(
                //   margin: EdgeInsets.all(4.0),
                //   color: day.weekday == DateTime.sunday ? Colors.grey : null,
                //   child: Center(
                //     child: Text(day.day.toString()),
                //   ),
                // );
              },
            ),
            // onVisibleDaysChanged: (datetime, datetime2, format) {
            //   setState(() {
            //     attendanceMonthYear = datetime;
            //   });
            // },
            // builders:

            //     CalendarBuilders(dayBuilder: (context, date, _) {
            //   //  if (data.hasData)
            //   //    print(data.data["a" + date.day.toString()]);

            //   return data.hasData
            //       ? Container(
            //           margin: EdgeInsets.all(4.0),
            //           color: date.weekday == DateTime.sunday
            //               ? greyColor.withOpacity(0.7)
            //               : getDayColor(data, date),
            //           child: Center(
            //             child: Text(date.day.toString()),
            //           ),
            //         )
            //       : Container();
            // },
            //  todayDayBuilder: (context, date, _) {
            //   return Container(
            //     margin: EdgeInsets.all(4.0),
            //     color: data.hasData
            //         ? getDayColor(data, date)
            //         : Colors.transparent,
            //     child: Center(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: blueColor,
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(date.day.toString()),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
            //  events: ,
          ),
        ],
      ),
    );
  }

  getDayColor(date) {
    for (var i = 0; i < attendanceController.data.length; i++) {
      print(" hey ${date.toString().split(" ").first}");
      print(
          " hey ${attendanceController.data[i].date.toString().split(" ").first}");
      print(
          " hey ${date.toString().split(" ").first == attendanceController.data[i].date.toString().split(" ").first}");
      if (attendanceController.data[i].attendance == "P" &&
          date.toString().split(" ").first ==
              attendanceController.data[i].date.toString().split(" ").first) {
        return Colors.green;
      } else if (attendanceController.data[i].attendance == "A" &&
          date.toString().split(" ").first ==
              attendanceController.data[i].date.toString().split(" ").first) {
        return Colors.red;
      } else if (attendanceController.data[i].attendance == "H" &&
          date.toString().split(" ").first ==
              attendanceController.data[i].date.toString().split(" ").first) {
        return Colors.grey;
      }
    }
    ;
    //    data.data["a" + date.day.toString()] == "H"
    //       ? yellowColor
    //       : data.data["a" + date.day.toString()] == "A"
    //           ? redColor
    //           : data.data["a" + date.day.toString()] == "P"
    //               ? greenColor
    //               : data.data["a" + date.day.toString()] == "SH"
    //                   ? orangeColor
    //                   : Colors.transparent;
  }
}
