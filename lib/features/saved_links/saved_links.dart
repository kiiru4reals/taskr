import 'package:flutter/material.dart';
import 'package:soluprov/features/saved_links/routes/add_links.dart';

class SavedLinks extends StatefulWidget {
  const SavedLinks({Key? key}) : super(key: key);

  @override
  _SavedLinksState createState() => _SavedLinksState();
}

class _SavedLinksState extends State<SavedLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your links"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLinks())),
        child: Icon(Icons.add),
      ),
      body: Center(child: Text("Save your links here!"),),
    );
  }
}
