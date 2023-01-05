import 'package:flutter/material.dart';
import 'package:json_serialized_secure_storage/widgets/decorated_text_field.dart';
import 'buttons.dart';
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
  final TextEditingController dataController = TextEditingController();

  static const storage = FlutterSecureStorage();
  DateTime? dateTime = DateTime.now();

  Future<void> storeLocally() async {
    InputtedData inputtedData = InputtedData(
      name: NameData(
        firstNameController.text,
        middleNameController.text,
        lastNameController.text,
      ),
      age: int.parse(ageController.text),
      dateTime: dateTime as DateTime,
    );

    String json = jsonEncode(inputtedData);
    //this is where to encrpyt
    await storage.write(key: 'user', value: json);
    await readAll();
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
    await readAll();
  }

  Future<void> readAll() async {
    Map<String, String> data = await storage.readAll();
    //this is where to decrypt
    dataController.text = data.toString();
  }

  Future<void> getDateTime(BuildContext context) async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: dateTime as DateTime,
      firstDate: DateTime(1970, 1, 1),
      lastDate: DateTime.now(),
    );
    dateTime = dt ?? dateTime;
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
            onPressed: () async => await getDateTime(context),
            child: const Text('Date Time'),
          ),
          Buttons(
            storeLocally: storeLocally,
            deleteAll: deleteAll,
            readAll: readAll,
          ),
          TextField(
            controller: dataController,
            readOnly: true,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
