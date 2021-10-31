import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';

class LoanInfoWidget extends StatelessWidget {
  final String description;
  final String value;

  const LoanInfoWidget(
      {Key? key, required this.description, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          description,
          style: kRegularTextStyle.copyWith(color: Colors.grey),
        ),
        Container(
          padding: kMainPadding,
          color: const Color(0xff1D1C44),
          child: Center(child: Text(value, style: kAppBarTextStyle)),
        )
      ],
    );
  }
}
