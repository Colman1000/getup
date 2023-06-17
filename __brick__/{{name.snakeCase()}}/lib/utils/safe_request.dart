import 'dart:io';

{{#firebase_auth}}
import 'package:firebase_auth/firebase_auth.dart';
{{/firebase_auth}}
{{#firebase_crashlytics}}
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
{{/firebase_crashlytics}}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/models/general/app_exeption.dart';

/// A helper class that wraps possible error codeblocks with a simple API to
/// handle errors
class SafeRequest<T> {
  static Future<T?> run<T>(
    Future<T> Function() func, {
    String? tag,
    void Function(AppException e)? onError,
    VoidCallback? onFinally,
    VoidCallback? onBegin,
    T? defaultValue,
  }) async {
    final localErrorHandler = onError ?? (e) => debugPrint(e.message);
    errorHandler(AppException e) {
      // Report Error to crashlytics
      {{#firebase_crashlytics}}
      FirebaseCrashlytics.instance.recordFlutterError(
        FlutterErrorDetails(
          exception: e,
          library: '{{name}} ${tag == null ? '' : ': $tag'}',
          stack: StackTrace.current,
        ),
      );
      {{/firebase_crashlytics}}
      {{^firebase_crashlytics}}
      /// Log error remote tracker like Crashlytics or Sentry
      {{/firebase_crashlytics}}
      localErrorHandler(e);
    }

    onBegin?.call();
    try {
      return await func();
    } on SocketException {
      const err = AppException('No Internet connection 😑');
      errorHandler(err);
    } on HttpException {
      const err = AppException('Resource not found 😱');
      errorHandler(err);
    } on FormatException {
      const err = AppException('Bad response format 👎');
      errorHandler(err);
    }
    {{#firebase_auth}}
    on FirebaseAuthException catch (e) {
      final err = AppException.fromAuthException(e);
      errorHandler(err);
    }
    {{/firebase_auth}}
    on PlatformException catch (e) {
      final err = AppException.fromPlatformException(e);
      errorHandler(err);
    } on AppException catch (e) {
      errorHandler(e);
    } catch (e) {
      errorHandler(const AppException());
    } finally {
      onFinally?.call();
    }
    return defaultValue;
  }
}
