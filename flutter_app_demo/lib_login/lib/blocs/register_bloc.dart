import 'dart:async';
import 'package:lib_login/blocs/bloc.dart';
import 'package:lib_login/fire_base/fire_base_auth.dart';

class RegisterBloc implements Bloc {
  var _firAuth = FirAuth();

  StreamController _nameController = new StreamController<String>.broadcast();
  StreamController _emailController = new StreamController<String>.broadcast();
  StreamController _passController = new StreamController<String>.broadcast();
  StreamController _phoneController = new StreamController<String>.broadcast();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValidRegister({String name, String email, String pass, String phone}) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Input your name");
      return false;
    }
    _nameController.sink.add("");

    if (email == null || email.length == 0) {
      _emailController.sink.addError("Input your mail");
      return false;
    }
    _emailController.sink.add('');

    if (pass == null || pass.length == 0) {
      _passController.sink.addError("Input your password");
      return false;
    }
    _passController.sink.add('');

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Input your number phone");
      return false;
    }
    _phoneController.sink.add('');

    return true;
  }

  void signUp(
      {String email,
      String pass,
      String phone,
      String name,
      Function onSuccess,
      Function(String) onRegisterError}) {
    _firAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
  }

  void signIn(
      {String email,
      String pass,
      Function onSuccess,
      Function(String) onRegisterError}) {
    _firAuth.signIn(email, pass, onSuccess, onRegisterError);
  }

  @override
  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _passController.close();
  }
}
