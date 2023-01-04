import 'package:flutter/material.dart';
import 'package:json_serialized_secure_storage/widgets/decorated_text_field.dart';

import '../models/inputted_data.dart';
import '../models/name_data.dart';
import 'name_input.dart';

class InputWidgets extends StatelessWidget {
  InputWidgets({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void saveData() {
    NameData nameData = NameData(firstNameController.text,
        middleNameController.text, lastNameController.text);

    int age = int.parse(ageController.text);

    InputtedData inputtedData = InputtedData(nameData, age);
    print(inputtedData);

    print(inputtedData.toJson());
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
            onPressed: saveData,
            child: const Text('Save Data'),
          )
        ],
      ),
    );
  }
}
