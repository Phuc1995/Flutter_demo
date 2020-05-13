import 'package:flutter/material.dart';

class RegisterWidgetPage {
  Widget textTitleRegister(String text, double fontSize, int color) {
    return Text(
      "$text",
      style: TextStyle(fontSize: fontSize, color: Color(color)),
    );
  }

  static void showLoadingDialog(BuildContext context, String msg){
    showDialog(context: context,
    //can't tap at blank space to close dialog
    barrierDismissible: false,
    builder: (context) => new Dialog(
        child: Container(
          color: Colors.white,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(msg, style: TextStyle(fontSize: 12),),
              )
            ],
          ),
        ),
    ));
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(showLoadingDialog);
  }
}
