import 'package:example/page2.dart';
import 'package:flutter/material.dart';
import 'package:router/simple_router.dart';

void main() {
  SimpleRouter.onBeforePush = (widget) {
    print('[Router]: Navigated to ${widget.toString()}');
  };
  SimpleRouter.onAfterPush = (widget) {
    print('[Router]: Navigated out of ${widget.toString()}');
  };
  runApp(MyApp());
}

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home page',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SimpleRouter.forward(Page2()),
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}
