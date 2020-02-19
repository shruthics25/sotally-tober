class Validators {
  String alphaNumericValidator(value) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (!validCharacters.hasMatch(value)) {
      return 'Please enter Alpha Numeric Values';
    }
    return null;
  }

  String onlydouble(value) {
    final validValue = RegExp(r'^(-?)(0|([1-9][0-9]*))(\\.[0-9]+)?$');
    if (!validValue.hasMatch(value)) {
      return 'Please enter only Digits';
    }
    return null;
  }

  String onlynumbers(value) {
    final validValue = RegExp(r'^[0-9]+$');
    if (!validValue.hasMatch(value)) {
      return 'Please enter only Digits';
    }
    return null;
  }

  String onlyCharacter(value) {
    final validValue = RegExp(r'^[a-zA-z ]+$');
    if (!validValue.hasMatch(value)) {
      return 'Please enter only Alphabets';
    }
    return null;
  }

  String emailValidation(value) {
    final validValue =
        RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if (!validValue.hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }
}
