import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:{{name.snakeCase()}}/config/keys.dart';

class Helpers {
  static final context = (Get.context ?? Get.overlayContext)!;

  static void feedback() {
    HapticFeedback.lightImpact();
  }

  static T ensureInitialized<T>(T Function() onRegister) {
    if (Get.isRegistered<T>()) {
      return Get.find<T>();
    }
    return Get.put<T>(onRegister());
  }
}

class Format {
  static const String _currency = '₦';
  // static const String _currency = 'N';

  static String toCurrency(num amount) {
    final number = amount.round().toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    return '$_currency$number';
  }
}

enum SnackBarType { error, warn, success, log }
