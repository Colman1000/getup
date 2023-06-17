import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
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
      FirebaseCrashlytics.instance.recordFlutterError(
        FlutterErrorDetails(
          exception: e,
          library: 'QwikServe ${tag == null ? '' : ': $tag'}',
          stack: StackTrace.current,
        ),
      );
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
    } /*on FirebaseFunctionsException catch (e) {
      final err = AppException.fromFirebaseException(e);
      errorHandler(err);
    }*/
    on FirebaseAuthException catch (e) {
      final err = AppException.fromAuthException(e);
      errorHandler(err);
    } on PlatformException catch (e) {
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
