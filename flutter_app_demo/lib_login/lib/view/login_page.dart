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
  final snack = "";
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void dispose() {
    registerBloc.dispose();
    bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        // set width and height for container
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Image.asset(
                Const.LOGO,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Login to continue using app',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                constraints: BoxConstraints.loose(Size(double.infinity, 50)),
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
              Builder(builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: () {
                      onSignInClicked(context);
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
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: RichText(
                  key: Key("signUpLink"),
                  text:  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            '/register',
                          );
                        },
                      text: "New user?Sign up for a new account",
                      style: TextStyle(
                          color: Color(0xff3277D8), fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSignInClicked(BuildContext con) {
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
