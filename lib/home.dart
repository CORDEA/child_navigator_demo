import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Details()),
              );
              if (kDebugMode) {
                print('result: $result');
              }
            },
            child: const Text('Details')),
      ),
    );
  }
}
