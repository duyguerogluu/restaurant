import 'package:flutter/material.dart';

class DuyguNav {
  DuyguNav._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> push(Widget screen) => navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_) => screen),
      );

  static Future<void> pushAndPopBack(Widget screen) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
}
