import 'package:flutter/material.dart';
import 'package:todo_app/constants/gap_sizes.dart';

Widget todoItems({
  required BuildContext context,
  required String title,
  required bool isDone,
  void Function()? editFunc,
  void Function()? deleteFunc,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 3, right: 3, top: 5),
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Row(
      children: [
        Text(title),
        const Spacer(),
        InkWell(
          onTap: () => {editFunc},
          child: Icon(
            Icons.edit,
            color: Theme.of(context).primaryColor,
          ),
        ),
        gapW4,
        InkWell(
          onTap: deleteFunc,
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}
