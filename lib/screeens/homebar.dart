import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            AppSettings.openAppSettings(
                type: AppSettingsType.device, asAnotherTask: true);
          },
          style: IconButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 216, 215, 213),
            padding: const EdgeInsets.all(12),
          ),
          iconSize: 33,
          icon: const Icon(
            Icons.grid_view,
          ),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 211, 210, 208),
            padding: const EdgeInsets.all(12),
          ),
          iconSize: 33,
          icon: const Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
