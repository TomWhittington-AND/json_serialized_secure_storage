import 'package:flutter/material.dart';
import 'package:json_serialized_secure_storage/widgets/decorated_text_field.dart';
import 'name_input.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:json_string/json_string.dart';
import 'dart:convert';

class InputWidgets extends StatelessWidget {
  InputWidgets({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  static const storage = FlutterSecureStorage();

  void storeLocally() async {
    await storage.write(key: 'firstName', value: firstNameController.text);
    await storage.write(key: 'middleName', value: middleNameController.text);
    await storage.write(key: 'lastName', value: lastNameController.text);
    await storage.write(key: 'age', value: ageController.text);
    print('secure storage output');

    Map<String, String> data = await storage.readAll();
    print(jsonEncode(data));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          NameInput(
            firstNameController: firstNameController,
            middleNameController: middleNameController,
            lastNameController: lastNameController,
          ),
          const SizedBox(height: 20),
          DecoratedTextField(
            labelText: 'Age',
            icon: Icons.numbers,
            controller: ageController,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: storeLocally,
            child: const Text('Save Data'),
          )
        ],
      ),
    );
  }
}
