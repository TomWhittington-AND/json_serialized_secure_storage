import 'package:flutter/material.dart';

class StorageDummy extends StatelessWidget {
  const StorageDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Button'),
          ),
        ],
      ),
    );
  }
}
