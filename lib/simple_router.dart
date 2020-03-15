library simple_router;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Class responsable for doing the navigation
class SimpleRouter {
  /// The navigatorKey, this is a required one. Use the default or set your own key
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// [bool] value to set the use of cupertino transitions
  static bool useCupertinoTransition = false;

  /// Middleware to be executed before the navigation
  static Function(Widget) onBeforePush;

  /// Middleware to be executed after the navigation
  static Function(Widget) onAfterPush;

  /// Method to set you own [navigatorKey]
  static void setKey(GlobalKey<NavigatorState> key) {
    navigatorKey = key;
  }

  /// Getter for [navigatorKey]
  static GlobalKey<NavigatorState> getKey() {
    return navigatorKey;
  }

  /// Forward navigation, it's similar to `Navigator.of(context).push`
  static Future<dynamic> forward(Widget widget, {String name}) async {
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

  /// Forward navigation and replace current one, it's similar
  /// to `Navigator.of(context).pushAndReplace`
  static Future<dynamic> forwardAndReplace(Widget widget, {String name}) async {
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

  /// Forward navigation and remove all routes until, it's similar
  /// to `Navigator.of(context).pushAndRemoveUntil`
  static Future<dynamic> forwardAndRemoveUntil(Widget widget, String route,
      {String name}) async {
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

  /// Forward navigation and remove all routes
  static Future<dynamic> forwardAndRemoveAll(Widget widget,
      {String name}) async {
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

  /// Back the navigation, it's similar with Navigator.of(context).pop()`
  static bool back<T extends Object>([T result]) {
    return navigatorKey.currentState.pop(result);
  }
}
