class FormValidation {
  static String? validator(
      {required String val, required String errmessage, String? upText}) {
    if (val.isEmpty) {
      return errmessage;
    }
    if (upText == 'Password' && val.length < 8) {
      return 'password must be 8 charatecter or more';
    }
    //? check if user enter a real email or not
    if (upText == 'email address') {
      if (val.contains(
          RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"))) {
        return null;
      } else {
        return 'enter a real email pls';
      }
    } else {
      return null;
    }
  }
}
