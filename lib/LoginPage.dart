import 'package:childrenshealthlog/AppInfo.dart';
import 'package:childrenshealthlog/SignUp.dart';
import 'package:childrenshealthlog/Start.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './AppInfo.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Start()),
        );
      }
    });
    @override
    void initState() {
      super.initState();
      this.checkAuthentication();
    }
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } on FirebaseAuthException catch (e) {
        showError(e.message.toString());
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(30),
                    child: Image(
                      image: AssetImage('images/loginpic.png'),
                      // fit: BoxFit.contain,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    //height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      //color: Colors.grey,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return "Enter E-mail";
                              },
                              decoration: InputDecoration(
                                labelText: "UserName",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                ),
                                fillColor: Colors.transparent,
                              ),
                              onSaved: (input) => _email = input!,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 300,
                            child: TextFormField(
                                validator: (input) {
                                  if (input!.isEmpty)
                                    return "Provide a min. of 6 characters";
                                },
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon:
                                      Icon(Icons.remove_red_eye_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                obscureText: true,
                                onSaved: (input) => _password = input!),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Login",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  color: Colors.black87,
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff1a73e8))),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                "New User?",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
