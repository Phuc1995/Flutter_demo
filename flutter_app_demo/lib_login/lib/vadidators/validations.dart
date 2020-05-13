class Vadications {

  static bool isValidUser(String user){
    return user != null && user.contains("@");
  }

  static bool isValidPass(String pass){
    return pass != null && pass.length > 6;
  }

}