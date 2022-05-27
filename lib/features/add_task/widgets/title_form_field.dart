import 'package:flutter/material.dart';

class TitleFormField extends StatefulWidget {
  const TitleFormField({Key? key}) : super(key: key);

  @override
  _TitleFormFieldState createState() => _TitleFormFieldState();
}

class _TitleFormFieldState extends State<TitleFormField> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (title) => title != null && title.isEmpty
          ? "Event must have a name"
          : null,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Laundry",
        label: Text("Task name"),
      ),
    );
  }
}
