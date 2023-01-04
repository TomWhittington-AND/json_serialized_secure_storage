import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'input_widgets.dart';

const storage = FlutterSecureStorage();
//final localStorage = new LocalStorage('my_app');

void storeLocally(
    String firstName, String middleName, String lastName, String age) async {
  await storage.write(key: 'firstName', value: firstName);
  await storage.write(key: 'middleName', value: middleName);
  await storage.write(key: 'lastName', value: lastName);
  await storage.write(key: 'age', value: age);

  print(storage);
}

class StorageDummy extends StatelessWidget {
  const StorageDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          InputWidgets(),
        ],
      ),
    );
  }
}
