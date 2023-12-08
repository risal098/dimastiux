class AccountMessage{
  static String emailValidator (String value) {
    final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
    if (emailValid != true){
      return 'Invalid email adress';
    }
    return '';
  }
}