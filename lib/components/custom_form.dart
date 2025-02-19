import 'package:flutter/material.dart';
import 'custom_input.dart';

class CustomForm extends StatelessWidget {
  final List<Map<String, dynamic>> fields;
  final List<Widget> buttons;
  final List<Widget>? extraWidgets;
  final GlobalKey<FormState> formKey;

  const CustomForm({
    Key? key,
    required this.fields,
    required this.buttons,
    this.extraWidgets,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...fields.map((field) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomInput(
                  label: field['label'],
                  isPassword: field['isPassword'] ?? false,
                  controller: field['controller'],
                  validator: field['validator'],
                ),
              )),
          const SizedBox(height: 40),
          ...buttons.map((button) => Padding(
                padding:  EdgeInsets.symmetric(vertical: 0),
                child: button,
              )),
          if (extraWidgets != null) ...extraWidgets!,
        ],
      ),
    );
  }
}
