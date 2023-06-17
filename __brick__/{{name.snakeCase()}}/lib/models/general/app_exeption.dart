import 'package:flutter/services.dart';
{{#firebase_auth}}
import 'package:firebase_auth/firebase_auth.dart';
{{/firebase_auth}}

class AppException implements Exception {
  @pragma('vm:entry-point')
  const AppException([this.message = defaultMessage]);

  {{#firebase_auth}}
  factory AppException.fromAuthException(FirebaseAuthException e) {
    String msg = defaultMessage;

    switch (e.code) {
      case 'invalid-email':
      case 'auth/invalid-email':
        msg = 'Email address is not valid';
        break;

      case 'user-disabled':
        msg = 'User has been disabled';
        break;

      case 'account-exists-with-different-credential':
        msg = 'Email already used with different sign-in provider';
        break;

      case 'user-not-found':
        msg = 'No account match';
        break;

      case 'email-already-in-use':
        msg = 'Email already in use';
        break;

      case 'weak-password':
        msg = 'Weak password. Try again';
        break;
      case 'requires-recent-login':
        msg = 'You need to re-sign in to update account';
        break;

      case 'network-request-failed':
        msg = 'Check your internet connection';
        break;

      case 'wrong-password':
        msg = 'Invalid password';
        break;
    }

    return AppException(msg);
  }

  factory AppException.fromPlatformException(PlatformException e) {
    String msg = defaultMessage;

    switch (e.code) {
      case 'sign_in_canceled':
        msg = 'Sign-in cancelled';
        break;

      case 'network_error':
        msg = 'Check your internet connection';
        break;

      case 'sign_in_failed':
        msg = 'Sign-in failed';
        break;

      default:
        msg = e.message ?? defaultMessage;
        break;
    }

    return AppException(msg);
  }

  {{/firebase_auth}}
  final String message;

  @override
  String toString() {
    return message;
  }

  static const String defaultMessage = 'Unknown Error';
}
