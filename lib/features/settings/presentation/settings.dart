import 'package:flutter/material.dart';
import 'package:soluprov/features/settings/presentation/widgets/general_settings.dart';
import 'package:soluprov/features/settings/presentation/widgets/presets.dart';
import 'package:soluprov/features/settings/presentation/widgets/settings_sliver_appbar.dart';
import 'package:soluprov/features/settings/presentation/widgets/shared_reminders.dart';
import 'package:soluprov/features/settings/presentation/widgets/version_info.dart';

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
