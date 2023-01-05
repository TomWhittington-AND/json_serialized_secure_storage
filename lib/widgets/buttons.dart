import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({this.storeLocally, this.deleteAll, this.readAll, super.key});
  final VoidCallback? storeLocally;
  final VoidCallback? deleteAll;
  final VoidCallback? readAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: storeLocally,
          child: const Text('Save Data'),
        ),
        ElevatedButton(
          onPressed: readAll,
          child: const Text('Read All'),
        ),
        ElevatedButton(
          onPressed: deleteAll,
          child: const Text('Delete All'),
        ),
      ],
    );
  }
}
