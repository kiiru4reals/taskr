import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soluprov/features/homepage/card.dart';
import 'package:soluprov/features/homepage/progress_card.dart';
import 'package:soluprov/features/homepage/tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          expandedHeight: 80,
          title: Text("Hello Kiiru",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
          floating: true,
          // flexibleSpace: FlexibleSpaceBar(
          //   background: Image.network("https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bm90ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          //   fit: BoxFit.cover,),
          // ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: Colors.black45,
            ),
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(
                "https://images.unsplash.com/photo-1513152697235-fe74c283646a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainTaskscard(),
              ProgressCard(),
              Tasks(),
            ],
          ),
        )
      ],
    ));
  }
}
