import 'package:childrenshealthlog/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './AppInfo.dart';
import './LoginPage.dart';
import './SignIn.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff26a1c8),
        title: Text(
          "Children's Health Log",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black87,
            fontFamily: 'Hubballi',
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppInfo()),
              );
            },
            tooltip: "App Info",
            icon: Icon(
              Icons.school,
              color: Colors.black87,
              size: 50,
            ),
            padding: EdgeInsets.only(right: 40),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff25b6d3),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('images/schoolresized.png'),
                  height: 200,
                  width: 200,
                  //fit: BoxFit.contain,
                ),
              ),
              Container(
                width: 300,
                height: 350,
                padding: EdgeInsets.only(top: 50, bottom: 50),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 217, 219),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(fontSize: 30),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff2da44e))),
                      ),
                    ),
                    //SizedBox(height: 80),
                    Container(
                      child: Expanded(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Expanded(
                              child: Divider(
                                height: 20,
                                thickness: 2,
                                // indent: 0,
                                // endIndent: 190,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Or",
                              style: GoogleFonts.spaceMono(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Divider(
                                height: 20,
                                thickness: 2,
                                // indent: 0,
                                // endIndent: 190,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "New User?",
                          style: GoogleFonts.spaceMono(
                            textStyle:
                                TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "Register",
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(fontSize: 30),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff2da44e)),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
