import 'package:flutter/material.dart';
import 'package:router/simple_router.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('I\'m on page 2'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SimpleRouter.back(),
        child: Icon(Icons.chevron_left),
      ),
    );
  }
}
