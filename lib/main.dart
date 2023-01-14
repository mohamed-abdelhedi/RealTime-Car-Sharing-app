import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/choice.dart';
import 'package:flutter_application_1/pages/sign-in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/DataHandler/appData.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(),
    child: MaterialApp(
      title: 'CarMate',
      home: HomePageWidget(),
      //home: email == null
      //   ? HomePageWidget()
      //  : ChosingWidget(), // i5ali ken home : homepagewidget() bech t3awed ta3mel sign in
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class RealTime extends StatelessWidget {
  const RealTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'CarMate',
        //home: email == null ? HomePageWidget() : ChosingWidget();
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
