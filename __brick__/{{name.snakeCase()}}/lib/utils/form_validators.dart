import 'package:get/get_utils/get_utils.dart';

class FormValidators {
  static const int minNumberOfCharacters = 8;

  static String? passwordValidator(String? v) {
    if (v == null || v.isEmpty) {
      return 'Password is required';
    }
    if (v.length < minNumberOfCharacters) {
      return 'Password must be at least $minNumberOfCharacters characters';
    }
    return null;
  }

  static String? emailValidator(String? v) {
    if (v == null || v.isEmpty) {
      return 'Email is required';
    }
    if (!v.isEmail) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? phoneValidator(String? v) {
    if (v == null || v.isEmpty) {
      return 'Phone is required';
    }
    if (!v.isPhoneNumber) {
      return 'Phone is invalid';
    }
    return null;
  }
}
