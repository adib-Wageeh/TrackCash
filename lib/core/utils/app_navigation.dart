import 'package:flutter/material.dart';

class AppNavigation {
  AppNavigation._();

  static final instance = AppNavigation._();

  static const pageTransitionDurMill = 0;

  Future<T?> push<T extends Object?>(
    BuildContext context,
    Widget page, {
    String? pageName,
    bool rootNavigator = false,
    opaque = true,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator).push<T>(
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => page,
        settings: RouteSettings(name: pageName ?? page.runtimeType.toString()),
        transitionsBuilder: transitionsBuilder,
        transitionDuration: const Duration(milliseconds: pageTransitionDurMill),
        opaque: opaque,
      ),
    );
  }

  Future pushReplacement(BuildContext context, Widget page,
      {String? pageName, bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        transitionsBuilder: transitionsBuilder,
        transitionDuration: const Duration(milliseconds: pageTransitionDurMill),
      ),
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
      BuildContext context, Widget page, bool Function(Route) predict,
      {String? pageName, bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => page,
        settings: RouteSettings(name: page.runtimeType.toString()),
        transitionsBuilder: transitionsBuilder,
        transitionDuration: const Duration(milliseconds: pageTransitionDurMill),
      ),
      predict,
    );
  }

  Future pop<T extends Object?>(BuildContext context,
      {bool rootNavigator = false, T? arguments}) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pop<T>(arguments);
  }

  bool canPop(BuildContext context, {bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).canPop();
  }

  FadeTransition transitionsBuilder(
      context, animation, secondaryAnimation, child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
