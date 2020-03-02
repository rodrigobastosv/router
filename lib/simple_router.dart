library router;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static bool useCupertinoTransition = false;

  static Function(Widget) onBeforePush;
  static Function(Widget) onAfterPush;

  static void setKey(GlobalKey<NavigatorState> key) {
    navigatorKey = key;
  }

  static GlobalKey<NavigatorState> getKey() {
    return navigatorKey;
  }

  static Future<dynamic> forward(Widget widget, [String name]) async {
    if (onBeforePush != null) {
      onBeforePush(widget);
    }

    dynamic routeFuture = await navigatorKey.currentState.push(
      useCupertinoTransition
          ? CupertinoPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            )
          : MaterialPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            ),
    );

    if (onAfterPush != null) {
      onAfterPush(widget);
    }
    return routeFuture;
  }

  static Future<dynamic> forwardAndReplace(Widget widget, [String name]) async {
    if (onBeforePush != null) {
      onBeforePush(widget);
    }

    dynamic routeFuture = await navigatorKey.currentState.pushReplacement(
      useCupertinoTransition
          ? CupertinoPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            )
          : MaterialPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            ),
    );

    if (onAfterPush != null) {
      onAfterPush(widget);
    }
    return routeFuture;
  }

  static Future<dynamic> forwardAndRemoveUntil(Widget widget, String route,
      [String name]) async {
    if (onBeforePush != null) {
      onBeforePush(widget);
    }

    dynamic routeFuture = await navigatorKey.currentState.pushAndRemoveUntil(
      useCupertinoTransition
          ? CupertinoPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            )
          : MaterialPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            ),
      (r) => r.settings.name == route,
    );

    if (onAfterPush != null) {
      onAfterPush(widget);
    }
    return routeFuture;
  }

  static Future<dynamic> forwardAndRemoveAll(Widget widget,
      [String name]) async {
    if (onBeforePush != null) {
      onBeforePush(widget);
    }

    dynamic routeFuture = await navigatorKey.currentState.pushAndRemoveUntil(
      useCupertinoTransition
          ? CupertinoPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            )
          : MaterialPageRoute(
              builder: (_) => widget,
              settings: RouteSettings(name: name ?? widget.toString()),
            ),
      (r) => false,
    );

    if (onAfterPush != null) {
      onAfterPush(widget);
    }
    return routeFuture;
  }

  static bool back<T extends Object>([T result]) {
    return navigatorKey.currentState.pop(result);
  }
}
