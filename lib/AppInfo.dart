import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfo extends StatefulWidget {
  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 107, 108, 109),
        iconTheme: IconThemeData(
          size: 40,
        ),
        title: Text(
          "OUR MISSION",
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                "OUR MISSION",
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(fontSize: 30),
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
