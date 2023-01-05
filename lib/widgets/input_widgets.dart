import 'package:flutter/material.dart';
import 'package:json_serialized_secure_storage/widgets/decorated_text_field.dart';
import 'name_input.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import '../models/inputted_data.dart';
import '../models/name_data.dart';

class InputWidgets extends StatelessWidget {
  InputWidgets({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  static const storage = FlutterSecureStorage();
  InputtedData addToModel() {
    NameData name = NameData(firstNameController.text,
        middleNameController.text, lastNameController.text);
    InputtedData inputtedData =
        InputtedData(name, int.parse(ageController.text));
    return inputtedData;
  }

  void storeLocally() async {
    final inputtedData = addToModel();

    String json = jsonEncode(inputtedData);
    await storage.write(key: 'user', value: json);

    Map<String, String> data = await storage.readAll();
    print(data);
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
