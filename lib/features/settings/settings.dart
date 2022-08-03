import 'package:flutter/material.dart';
import 'package:soluprov/features/settings/widgets/general_settings.dart';
import 'package:soluprov/features/settings/widgets/presets.dart';
import 'package:soluprov/features/settings/widgets/settings_sliver_appbar.dart';
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
        SettingsSliverAppBar(),
        SliverToBoxAdapter(
          child: Column(
            children: const [
              Presets(),
              GeneralSettings(),
              SharedReminders(),
              VersionInfo()
            ],
          ),
        )
      ],
    ));
  }
}
