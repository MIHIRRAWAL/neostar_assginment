class Validation {
  static bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool isEmpty(String data) {
    return data.isEmpty;
  }

  static bool validateMinChar(String data) => data.length > 3 ? true : false;

  static bool validatePassword(String password) {
    Pattern pattern =
        r'^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+\-=[\]{};:\\|,.<>/?])[\w!@#$%^&*()_+\-=[\]{};\\|,.<>/?]*$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(password)) ? true : false;
  }

  static bool validatePhoneNumberLength(String mobile) =>
      mobile.length == 10 ? true : false;

  static bool validateConfirmPassword(
          String password, String confirmPassword) =>
      password != confirmPassword;

  static bool validateCharAndNumber(String value) {
    Pattern pattern = r'^[a-zA-Z0-9]+$';
    final regex = RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool validateCharacters(String value) {
    Pattern pattern = r'^[a-zA-Z]+$';
    final regex = RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool validatePinCode(String value) => value.length == 6;
}
