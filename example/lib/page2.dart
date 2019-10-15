import 'package:flutter/material.dart';
import 'package:router/router.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('I\'m on page 2'),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Router.back(), child: Icon(Icons.chevron_left),),
    );
  }
}
