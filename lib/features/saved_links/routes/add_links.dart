import 'package:flutter/material.dart';

class AddLinks extends StatefulWidget {
  const AddLinks({Key? key}) : super(key: key);

  @override
  _AddLinksState createState() => _AddLinksState();
}

class _AddLinksState extends State<AddLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a link"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
