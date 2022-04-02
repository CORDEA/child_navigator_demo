import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';
import 'details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Details()),
              );
              if (kDebugMode) {
                print('result: $result');
              }
            },
            child: const Text('Details'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // or showBottomSheet
              showModalBottomSheet(
                context: context,
                constraints: const BoxConstraints.tightForFinite(height: 300),
                builder: (_) => const AppBottomSheet(),
              );
            },
            child: const Text('Bottom sheet'),
          ),
        ],
      ),
    );
  }
}
