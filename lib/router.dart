library router;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static bool useCupertinoTransition = false;

  static Function(Widget) onBeforePush;
  static Function(Widget) onAfterPush;

  static GlobalKey<NavigatorState> getKey() {
    return navigatorKey;
  }

  static Future<dynamic> forward(Widget widget) async {
    if (onBeforePush != null) {
      onBeforePush(widget);
    }

    dynamic routeFuture = await navigatorKey.currentState.push(
        useCupertinoTransition
            ? CupertinoPageRoute(builder: (_) => widget)
            : MaterialPageRoute(builder: (_) => widget));

    if (onAfterPush != null) {
      onAfterPush(widget);
    }
    return routeFuture;
  }

  static bool back<T extends Object>([T result]) {
    return navigatorKey.currentState.pop(result);
  }
}

