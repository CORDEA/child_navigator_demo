import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'child_navigator.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ColoredBox(
              color: Colors.lightGreen,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'from details');
                  },
                  child: const Text('Return to home'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ChildNavigator(home: _Page1()),
          ),
        ],
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black12,
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => _Page2()),
            );
            if (kDebugMode) {
              print('result: $result');
            }
          },
          child: const Text('Navigate'),
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'from child of details');
            },
            child: const Text('Return to previous page'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop('from child of details');
            },
            child: const Text('Return to home'),
          ),
        ],
      ),
    );
  }
}
