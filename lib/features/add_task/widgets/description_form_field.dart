import 'package:flutter/material.dart';

class DescriptionFormField extends StatefulWidget {
  const DescriptionFormField({Key? key}) : super(key: key);

  @override
  _DescriptionFormFieldState createState() => _DescriptionFormFieldState();
}

class _DescriptionFormFieldState extends State<DescriptionFormField> {
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionController,
      decoration: const InputDecoration(
        label: Text("Task description"),
        border: UnderlineInputBorder(),
        hintText: "Enter description",
      ),
    );
  }
}
