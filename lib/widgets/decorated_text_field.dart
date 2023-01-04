import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final bool isButton;
  final bool readOnly;
  final VoidCallback? buttonPressed;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final String? value;

  const DecoratedTextField({
    required this.labelText,
    required this.icon,
    this.controller,
    this.value,
    this.buttonPressed,
    this.onChange,
    this.onTap,
    this.isButton = false,
    this.readOnly = false,
    super.key,
  });

  const DecoratedTextField.button({
    required this.labelText,
    required this.icon,
    this.controller,
    this.value,
    required this.buttonPressed,
    this.onChange,
    this.onTap,
    this.isButton = true,
    this.readOnly = false,
    super.key,
  });

  void handleOnChange(String value) {
    if (onChange != null) {
      onChange!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(50.0));
    return TextField(
      onTap: onTap,
      onChanged: handleOnChange,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: borderRadius),
        border: OutlineInputBorder(borderRadius: borderRadius),
        labelText: labelText,
        suffixIcon: getIcon(),
      ),
    );
  }

  Widget getIcon() {
    Icon iconData = Icon(
      icon,
      color: Colors.black,
    );

    return Align(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: isButton
          ? IconButton(
              onPressed: buttonPressed,
              icon: iconData,
            )
          : iconData,
    );
  }
}
