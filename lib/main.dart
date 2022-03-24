import 'package:flutter/material.dart';
import './Start.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: "CHL",
      // theme: ThemeData(
      //   primaryColor: Color.fromARGB(255, 55, 62, 66),
      // ),
      home: Start(),
    );
  }
}
