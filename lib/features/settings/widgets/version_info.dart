import 'package:flutter/material.dart';
import 'package:soluprov/core/styles.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("App info",style: TextStyle(fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey),),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){},
                title: Text("Taskr"),
                subtitle: Text("1.0", style: TextStyle(color: Colors.purple) ,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
