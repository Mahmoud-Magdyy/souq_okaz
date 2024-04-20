
class MyValidators {
  static Function(String?) notEmptyValidator = (value){
    if (value == null || value.isEmpty) return "please enter a value";
  };

  static Function(String?) emailValidator = (value){
    if (value == null || value.isEmpty) return "please enter a value";
    bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) return "Email must be a valid email";
  };

  static Function(String?) phoneNumberValidator = (value){
    if (value == null || value.isEmpty) return "please enter a value";
    if (value.length != 9) return "please it should be 9 numbers";
  };

  static Function(String?) passwordValidator = (value){
    if (value == null || value.isEmpty) return "please enter a value";
    if (value.length < 6) return "please it should be 6 characters";
  };
}