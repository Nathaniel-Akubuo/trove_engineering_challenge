import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';

class CustomListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String? subtitle;
  final GestureTapCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.iconData,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style:
              kAppBarTextStyle.copyWith(fontSize: 14, color: Colors.black54)),
      subtitle: subtitle == null
          ? null
          : Text(subtitle!,
              style: kAppBarTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54)),
      leading: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Icon(iconData, color: Colors.green),
      ),
    );
  }
}
