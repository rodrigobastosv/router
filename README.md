
# example  
  
A new Flutter project.  
 
## Using
  
The easiest way to use the router is to set the navigatorKey provided by the Router to the material app. Using that you can navigate from anywhere on your app (including places that don't have a BuildContext), including BloC's (not saying you have to do that by any means).

```dart
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
      return MaterialApp(  
          navigatorKey: SimpleRouter.getKey(),  
          title: 'Flutter Demo',  
          theme: ThemeData(  
              primarySwatch: Colors.blue,  
          ),  
          home: MyHomePage(title: 'Flutter Router Example'),  
      );  
  }  
}
```

Another great thing you can do is implement to functions of the Router: `onBeforePush` and `onAfterPush`, those functions are called before and after the navigation occurs. They are good to implement some kind of logging when entering or leaving the page for example.

You can choose beetwen Material or Cupertino transitions. To pick cupertino just set the `useCupertinoTransition` of the SimpleRouter to true (default is false).