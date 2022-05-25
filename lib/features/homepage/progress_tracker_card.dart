import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/config.dart';
import 'package:soluprov/features/events/services/event_provider.dart';

class MainTaskscard extends StatefulWidget {
  const MainTaskscard({Key? key}) : super(key: key);

  @override
  _MainTaskscardState createState() => _MainTaskscardState();
}

class _MainTaskscardState extends State<MainTaskscard> {
  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.black45,
        elevation: 15,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("Track your productivity", style: Config.titleTextStyle
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('You have ${eventsProvider.events.length} tasks to do.' ,
                        style: Config.smallTextStyle),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
