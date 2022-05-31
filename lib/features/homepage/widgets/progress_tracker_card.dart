import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/features/tasks/services/task_provider.dart';

class MainTasksCard extends StatefulWidget {
  const MainTasksCard({Key? key}) : super(key: key);

  @override
  _MainTasksCardState createState() => _MainTasksCardState();
}

class _MainTasksCardState extends State<MainTasksCard> {
  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<TaskProvider>(context);
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
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: const [
                      Text("Track your productivity", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      ),
                    ],
                  ),
                  Column(
                    children:[
                      Text('You have ${eventsProvider.events.length} tasks' ,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
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
