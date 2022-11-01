

 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schoolman/utility.dart';

import 'Colors.dart';
import 'Screens/HomeScreen/View/HomeScreen.dart';
import 'Screens/LoginScreen/View/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  var token = await getToken();
  Widget startScreen = LoginScreen();

  if (token != null) {
    startScreen = HomeScreen();
  }
  runApp(MyApp(startScreen));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  MyApp(this.startScreen);
  final Widget startScreen;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: bg,
          // backgroundColor: bg,
          appBarTheme: AppBarTheme(backgroundColor: bg),
          textTheme: TextTheme()),
      home: startScreen,
    );
  }
}
