import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soluprov/core/config.dart';
import 'package:soluprov/features/events/services/event_provider.dart';

class ProgressCard extends StatefulWidget {
  const ProgressCard({Key? key}) : super(key: key);

  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
/*  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Priority",
                style: Config.listTileTitleStyling,
              ),
              eventsProvider.events.length == 0
                  ? SizedBox()
                  : TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text("See more"),
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                          ),
                        ],
                      )),
            ],
          ),
        ),
        eventsProvider.events.length == 0
            ? Center(
                child: Text(
                  "No tasks to show here",
                  style: TextStyle(color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
                ),
              )
            : Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Card(
                      color: Colors.blue,
                      elevation: 15,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "22 May, 2022",
                                  style: Config.inProgressCard,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Web Design,\n E-commerce",
                                    style: Config.titleTextStyle,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Due in: ",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        "3 days",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Card(
                      color: Colors.blue,
                      elevation: 15,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "22 May, 2022",
                                  style: Config.inProgressCard,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Web Design,\n E-commerce",
                                    style: Config.titleTextStyle,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Due in: ",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        "3 days",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    ); /*DefaultTabController(
      length: 5,
      child: Column(
        children: const [
          TabBar(
             indicatorColor: Colors.black,
              indicatorWeight: 4,
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs:  [
                Tab(child: Text("All"),),
                Tab(child: Text("Recently"),),
                Tab(child: Text("Today"),),
                Tab(child: Text("Upcoming"),),
                Tab(child: Text("Overdue"),),
              ]),
          //TabViews(),
        ],
      ),
    );*/
  }
}
