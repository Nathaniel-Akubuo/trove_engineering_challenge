import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';

class CustomListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final GestureTapCallback? onTap;

  const CustomListTile(
      {Key? key, required this.iconData, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: kRegularTextStyle),
      leading: Icon(iconData, color: Colors.white),
    );
  }
}
