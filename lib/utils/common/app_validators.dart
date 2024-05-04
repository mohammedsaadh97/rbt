
String validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return 'Invalid Email';
  } else {
    return "";
  }
}

String validateUrl(String url) {
  String urlPattern = r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  var result = new RegExp(urlPattern, caseSensitive: false).firstMatch(url);

  if (result != null) {
    return ' Invalid URL';
  } else {
    return ' Valid URL';
  }
}

String? validateEmptyCheck(String value, String errorText) {
  return value.trim().length < 1 ? errorText : null;
}

// Empty Check feature and minimum required length condition Validation(like CVV, Minimum Name Field of Character Length, Message field of Minimum content length etc...)
int validateEmptyAndLengthCheck(String stringValue, int maxLength, {int minLength = 0}) {
  // 0 = null
  // 1 = Empty Field
  // 4 = requiredLength

  int errorFlag = 0;

  if (stringValue.length > 0) {
    if (minLength != 0 && stringValue.length < minLength) {
      errorFlag = 4;
    } else {
      errorFlag = 0;
    }
  } else {
    errorFlag = 1;
  }

  return errorFlag;
}


// Error Message's Container.
String validatedFieldOfErrorMessage(int errorFlag, {required String fieldName, required int requiredLength}) {
  // errorFlag :  It is thrown from different validator methods, So each flag represent unique error message.
  // fieldName :  Here fieldName can be consider as Field Label Name or value of Field, that to show in error message.
  // requiredLength :  Field value/String value of required min length to show in Error message.

  var msg;
  switch (errorFlag) {
    case 0:
      {
        msg = null;
      }
      break;
    case 1:
      {
        msg = "$fieldName can't be empty";
      }
      break;
    case 2:
      {
        msg = "Min 5 char required";
      }
      break;
    case 3:
      {
        msg = "Password doesn't match";
      }
      break;
    case 4:
      {
        msg = "Minimum $requiredLength Character are required.";
      }
      break;
    default:
      {
        msg = null;
      }
      break;
  }
  return msg;
}


String? validateText(String? formText) {
  if (formText!.isEmpty) return "Field is Required";

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword!.isEmpty) return "Password Is Required";

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
    Password must be at least 8 character
    include an uppercase letter, number and symbol.
    ''';
  }
}

