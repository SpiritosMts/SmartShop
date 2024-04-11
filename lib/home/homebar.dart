import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

import '../bindings.dart';
import '../generalWidgets.dart';

class HomeAppBar extends StatelessWidget {


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
          onPressed: () async {


         // homeCtr.myCart = await authCtr.loadCart();
          // await authCtr.saveCart(homeCtr.myCart);///save cart
            //print('## ${homeCtr.allClothes.length}');
            homeCtr.update();
          },
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
