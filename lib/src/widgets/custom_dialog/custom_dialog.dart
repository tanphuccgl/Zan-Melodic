import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/routes/coordinator.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.body,
    required this.textAccept,
    required this.onPressed,
    this.title,
  }) : super(key: key);
  final Widget body;
  final Widget? title;
  final String textAccept;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.colorBlack,
      contentPadding: const EdgeInsets.all(16.0),
      title: title,
      content: body,
      actions: <Widget>[
        TextButton(
            onPressed: () => XCoordinator.pop(context),
            child: Text(
              'CANCEL',
              style: _styleTextButton(),
            )),
        TextButton(
            onPressed: onPressed,
            child: Text(textAccept, style: _styleTextButton())),
      ],
    );
  }

  TextStyle _styleTextButton() {
    return Style.textTheme()
        .titleMedium!
        .copyWith(fontWeight: FontWeight.w600, fontSize: 17);
  }
}
