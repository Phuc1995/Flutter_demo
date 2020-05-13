import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_login/blocs/register_bloc.dart';
import 'package:lib_login/const/const.dart';
import '../blocs/login_bloc.dart';
import 'package:lib_login/view/register/register_widget_page.dart';
import 'package:lib_login/view/register/msg_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final registerBloc = Modular.get<RegisterBloc>();
  LoginBloc bloc = new LoginBloc();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

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
                Const.LOGO,
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
                  child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) => TextField(
                      controller: _userController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: "Username",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          prefixIcon:
                              Container(width: 50, child: Icon(Icons.email)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18),
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        prefixIcon:
                            Container(width: 50, child: Icon(Icons.lock)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
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
                    onPressed: () {
                      onSignInClicked();
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  '/register',
                                );
                              },
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

  void onSignInClicked() {
    RegisterWidgetPage.showLoadingDialog(context, "Loading ....");
    registerBloc.signIn(
        email: _userController.text,
        pass: _passController.text,
        onSuccess: () {
          RegisterWidgetPage.hideLoadingDialog(context);
          Navigator.pushNamed(context, "/home");
        },
        onRegisterError: (msg) {
          RegisterWidgetPage.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Sign In error", msg);
        });
  }
}
