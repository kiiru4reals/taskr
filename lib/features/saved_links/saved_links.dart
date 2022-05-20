import 'package:flutter/material.dart';

class SavedLinks extends StatefulWidget {
  const SavedLinks({Key? key}) : super(key: key);

  @override
  _SavedLinksState createState() => _SavedLinksState();
}

class _SavedLinksState extends State<SavedLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Save your links here!"),),
    );
  }
}
