import 'package:get/get.dart';

class Validators {
  static String? validateField(String name) {
    if (name.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return "Email is required";
    }
    if (!GetUtils.isEmail(email)) {
      return "Invalid email";
    }
    return null;
  }

  static String? validatePasswords(String password, confirmPassword) {
    if (validateField(password) == null &&
        validateField(confirmPassword) == null) {
      if (password != confirmPassword) {
        return 'Passwords do not match';
      } else {
        return null;
      }
    }
    return null;
  }

  static String? validatePasswordLength(String? password) {
    // Vérifie la longueur du mot de passe
    if (password!.isEmpty) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password must be at least 8 characters";
    }

    // Retourne null si le mot de passe est valide
    return null;
  }
}
