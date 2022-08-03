import 'package:flutter/material.dart';

class DateDropDownField extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const DateDropDownField(
      {Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
      onTap: onClicked,
    );
  }
}

class TimeDropDownField extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const TimeDropDownField(
      {Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
      onTap: onClicked,
    );
  }
}
