import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<DateTime>? onDateSelected;

  const CustomBottomSheet({Key? key, this.controller, this.onDateSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kMainPadding,
      decoration:
          const BoxDecoration(borderRadius: kRoundedTopBorder, color: Colors.white),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Text(
            'Take a loan',
            style: kAppBarTextStyle.copyWith(color: Colors.black),
          ),
          verticalSpaceLarge,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: CustomTextFormField.regular(
                  controller: controller,
                  textColor: Colors.black,
                  labelText: 'Amount',
                  keyboardType: TextInputType.number,
                ),
              ),
              horizontalSpaceMedium,
              Expanded(
                child: DateTimeFormField(
                  initialDate: DateTime.now().add(const Duration(days: 180)),
                  firstDate: DateTime.now().add(const Duration(days: 180)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  dateTextStyle: kRegularTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                    labelStyle: kRegularTextStyle.copyWith(
                        fontSize: 15, color: Colors.grey),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: kGreen)),
                    hintStyle: kRegularTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    suffixIcon: const Icon(Icons.event_note),
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: onDateSelected,
                ),
              ),
            ],
          ),
          verticalSpaceLarge,
          RoundedButton(
            color: kGreen,
            child: Text('PROCEED', style: kButtonTextStyle),
          )
        ],
      ),
    );
  }
}
