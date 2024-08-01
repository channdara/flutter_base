import 'dart:math';

import 'package:flutter/material.dart';

extension BaseContextExtension on BuildContext {
  double screenHeight([double percentage = 1.0]) =>
      MediaQuery.sizeOf(this).height * max(0.0, percentage);

  double screenWidth([double percentage = 1.0]) =>
      MediaQuery.sizeOf(this).width * max(0.0, percentage);

  void pop<T extends Object?>({
    T? result,
    bool rootNavigator = false,
  }) {
    Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pop<T>(result);
  }

  Future<T?> push<T extends Object?>(
    StatefulWidget screen, {
    bool rootNavigator = false,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).push<T>(MaterialPageRoute<T>(
      builder: (context) => screen,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
    ));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    StatefulWidget screen, {
    TO? result,
    bool rootNavigator = false,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
  }) {
    return Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).pushReplacement<T, TO>(
      MaterialPageRoute<T>(
        builder: (context) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
      ),
      result: result,
    );
  }

  Future<T?> pushReplaceAll<T extends Object?, TO extends Object?>(
    StatefulWidget screen, {
    TO? result,
    bool rootNavigator = false,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    RouteSettings? settings,
  }) {
    Navigator.of(
      this,
      rootNavigator: rootNavigator,
    ).popUntil((route) => route.isFirst);
    return pushReplacement(
      screen,
      result: result,
      rootNavigator: rootNavigator,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      barrierDismissible: barrierDismissible,
      settings: settings,
    );
  }
}
