import 'package:flutter/material.dart';
import 'package:todo_app/constants/gap_sizes.dart';

Widget settingItem(
    {required context,
    required title,
    required icon,
    String switchType = 'nonSwitch',
    String itemType = 'noDelete',
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: itemType != 'noDelete' ? Colors.red : null,
        ),
        gapW20,
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        gapW20,
      ],
    ),
  );
}

Widget settingTitle(BuildContext context, String title) {
  return Text(
    title,
    style: TextStyle(
      color: Theme.of(context).primaryColor,
    ),
  );
}
