import 'dart:async';
import 'package:lib_login/blocs/bloc.dart';
import 'package:lib_login/vadidators/validations.dart';
class LoginBloc extends Bloc{
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String user, String pass){
    if(!Vadications.isValidUser(user)){
      _userController.sink.addError("User error");
      return false;
    }
    _userController.sink.add("Oke");

    if(!Vadications.isValidPass(pass)){
      _passController.sink.addError("Pass error");
      return false;
    }
    _passController.sink.add("Oke");

    return true;
  }

  @override
  void dispose() {
    _userController.close();
    _passController.close();
  }


}