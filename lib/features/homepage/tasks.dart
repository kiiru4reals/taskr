import 'package:flutter/material.dart';
import 'package:soluprov/config.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Tasks", style: Config.titleTextStyleonBlack),
      ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.black12,
            child: ListTile(
              trailing: Icon(Icons.chevron_right, size: 40,),
              onTap: (){},
              title: Text("Task one ", style: Config.listTileTitleStyling,),
              subtitle: Text("Some more basic information about this particular reminder", style: Config.listTileSubtitleStyling ,),
            ),

          ),
        ),
    ]
    );
  }
}
