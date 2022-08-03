import 'package:flutter/material.dart';

class SettingsSliverAppBar extends StatelessWidget {
  const SettingsSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Opacity(
          opacity: .75,
          child: Image.network(
            "https://images.unsplash.com/photo-1517842645767-c639042777db?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true",
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
