import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';

class DateFormField extends StatelessWidget {
  final ValueChanged<DateTime>? onDateSelected;

  const DateFormField({Key? key, this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialDate: DateTime.now().add(const Duration(days: 180)),
      firstDate: DateTime.now().add(const Duration(days: 180)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      dateTextStyle: kRegularTextStyle.copyWith(
          fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Due Date',
        labelStyle:
            kRegularTextStyle.copyWith(fontSize: 15, color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: kGreen)),
        hintStyle: kRegularTextStyle.copyWith(
            color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
        suffixIcon: const Icon(Icons.event_note, color: kGreen,),
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
      onDateSelected: onDateSelected,
    );
  }
}
