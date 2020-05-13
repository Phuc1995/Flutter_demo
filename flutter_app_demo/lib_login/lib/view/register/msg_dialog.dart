import 'package:flutter/material.dart';

class MsgDialog {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text(title),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop(MsgDialog);
                  },
                )
              ],
            ));
  }
}
