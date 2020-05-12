import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/login/logo_login.jpg',
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  'welcomeBack',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Text(
                'Login to continue using app',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  key: Key('usernameField'),
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon:
                          Container(width: 50, child: Icon(Icons.email)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  key: Key('passwordField'),
                  style: TextStyle(fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Container(width: 50, child: Icon(Icons.lock)),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 40)),
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  key: Key("signUpLink"),
                  text: TextSpan(
                      text: "New user? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(

                            text: "Sign up for a new account",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
