import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/config.dart';
import 'package:soluprov/provider/event_provider.dart';

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
              SizedBox(width: 15,),
              SizedBox(
                width: 85,
                child: eventsProvider.events.length == 0 ? CircleProgressBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black12,
                  value: 0,
                  child:  Center(
                    child: AnimatedCount(
                      unit: '%',
                      count: 0, style: TextStyle(color: Colors.white),
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                ) : CircleProgressBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black12,
                  value: .65,
                  child:  Center(
                    child: AnimatedCount(
                      unit: '%',
                      count: 65, style: TextStyle(color: Colors.white),
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}