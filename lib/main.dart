import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/choice.dart';
import 'package:flutter_application_1/pages/sign-in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  await Firebase.initializeApp();

  runApp(RealTime(
      // home: email == null ? HomePageWidget() : ChosingWidget(),
      //debugShowCheckedModeBanner: false,
      ));
}

class RealTime extends StatelessWidget {
  const RealTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
