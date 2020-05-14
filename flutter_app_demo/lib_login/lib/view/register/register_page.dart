import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_widget_page.dart';
import 'package:lib_login/const/const.dart';
import 'package:lib_login/blocs/register_bloc.dart';
import 'package:lib_login/view/register/msg_dialog.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerBloc = Modular.get<RegisterBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final registerWidgetPage = new RegisterWidgetPage();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Image.asset(Const.LOGO),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: registerWidgetPage.textTitleRegister(
                    "Welcome Aboard!", 22, 0xff333333),
              ),
              registerWidgetPage.textTitleRegister(
                  "Signup with app in simple steps", 16, 0xff606470),
              SizedBox(
                height: 50,
              ),
              StreamBuilder(
                stream: registerBloc.nameStream,
                builder: (context, snapshot) => TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "User Name",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon:
                          Container(width: 50, child: Image.asset(Const.USER)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: registerBloc.emailStream,
                builder: (context, snapshot) => TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon: Container(
                          width: 50, child: Image.asset(Const.EMAIL)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: registerBloc.passStream,
                builder: (context, snapshot) => TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon: Container(
                          width: 50, child: Image.asset(Const.PASSWORD)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: registerBloc.phoneStream,
                builder: (context, snapshot) => TextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: "Number phone",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      prefixIcon: Container(
                          width: 50, child: Image.asset(Const.PHONE)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              Builder(builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: (){

                      onSignUpClicked(context);

                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            '/',
                          );
                        },
                      text: "Already a User? Login now",
                      style: TextStyle(color: Color(0xff3277D8), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: "",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSignUpClicked(BuildContext con) {
    var isValidRegister = registerBloc.isValidRegister(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        pass: _passController.text);
    if (isValidRegister) {
      //create user
      //loading dialog
      RegisterWidgetPage.showLoadingDialog(context, "Loading...");
      registerBloc.signUp(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          pass: _passController.text,
          onSuccess: () {
            RegisterWidgetPage.hideLoadingDialog(context);
            Navigator.pushNamed(context, "/");
            MsgDialog.showMsgDialog(context, "Sign Up Success", "Login to using app");
          },
          onRegisterError: (msg) {
            RegisterWidgetPage.hideLoadingDialog(context);
            MsgDialog.showMsgDialog(context, "Sign Up Error", msg);
          });
    }
  }
}
