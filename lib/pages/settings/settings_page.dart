import 'package:flutter/material.dart';
import 'package:todo_app/constants/gap_sizes.dart';
import 'package:todo_app/pages/settings/widgets/setting_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // gapH16,
              settingTitle(context, 'ToDo Settings'),
              gapH20,
              settingItem(
                context: context,
                title: 'Tap List',
                icon: Icons.touch_app_outlined,
              ),
              gapH20,
              settingItem(
                context: context,
                title: 'Reorder',
                icon: Icons.menu,
              ),
              gapH20,
              gapH20,
              settingTitle(context, 'Customize'),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Theme',
                  icon: Icons.bedtime_outlined),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Theme Color',
                  icon: Icons.color_lens_outlined),
              gapH20,
              gapH20,
              settingTitle(context, 'About'),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Help',
                  icon: Icons.help_center_outlined),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Rate this App',
                  icon: Icons.rate_review_outlined),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Licenses',
                  icon: Icons.file_present),
              gapH20,
              gapH20,
              settingTitle(context, 'Delete Data'),
              gapH20,
              settingItem(
                  context: context,
                  title: 'Delete Data',
                  icon: Icons.delete_forever_outlined,
                  itemType: 'delete'),
              gapH20,
            ],
          ),
        ),
      ),
    );
  }
}
