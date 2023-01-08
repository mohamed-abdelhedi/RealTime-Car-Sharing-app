import 'package:flutter/material.dart';
import 'pages/GetStarted.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(RealTime());
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
