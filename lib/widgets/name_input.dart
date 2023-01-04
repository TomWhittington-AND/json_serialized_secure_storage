import 'package:flutter/material.dart';

import 'decorated_text_field.dart';

class NameInput extends StatelessWidget {
  const NameInput(
      {required this.firstNameController,
      required this.middleNameController,
      required this.lastNameController,
      super.key});
  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          DecoratedTextField(
            labelText: 'First Name',
            icon: Icons.person,
            controller: firstNameController,
          ),
          DecoratedTextField(
            labelText: 'Middle Name',
            icon: Icons.person,
            controller: middleNameController,
          ),
          DecoratedTextField(
            labelText: 'Last Name',
            icon: Icons.person,
            controller: lastNameController,
          ),
        ],
      ),
    );
  }
}
