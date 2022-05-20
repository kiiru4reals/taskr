import 'package:flutter/material.dart';
import 'package:soluprov/config.dart';
import 'package:soluprov/features/settings/widgets/general_settings.dart';
import 'package:soluprov/features/settings/widgets/presets.dart';
import 'package:soluprov/features/settings/widgets/shared_reminders.dart';
import 'package:soluprov/features/settings/widgets/version_info.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,

              background: Opacity(
                opacity: .75,
                child: Image.network("https://images.unsplash.com/photo-1517842645767-c639042777db?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true",
                fit: BoxFit.cover,),
              ),
              title: Text("Settings", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Presets(),
                GeneralSettings(),
                SharedReminders(),
                VersionInfo()
              ],
            ),
          )
        ],
      )
    );
  }
}