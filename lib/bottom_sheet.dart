import 'package:flutter/material.dart';

import 'child_navigator.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: ChildNavigator(home: _Page1()),
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, _PageRoute(builder: (_) => _Page2()));
        },
        child: const Text('Navigate'),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Return to previous page'),
      ),
    );
  }
}

class _PageRoute<T> extends MaterialPageRoute<T> {
  _PageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return const CupertinoPageTransitionsBuilder().buildTransitions(
      this,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
