import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trove/constants/styles.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;

  final Color? textColor;
  final String? hintText;
  final bool autoFocus;
  final bool isPasswordTextField;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  bool obscureText;

  CustomTextFormField.regular(
      {Key? key,
      this.controller,
      this.onChanged,
      this.autovalidateMode,
      this.textColor,
      this.hintText,
      this.autoFocus = false,
      this.isPasswordTextField = false,
      this.keyboardType,
      this.textInputAction,
      this.inputFormatters,
      this.labelText,
      this.obscureText = false,
      this.validator})
      : super(key: key);

  CustomTextFormField.password(
      {Key? key,
      this.controller,
      this.onChanged,
      this.autovalidateMode,
      this.textColor,
      this.hintText,
      this.autoFocus = false,
      this.isPasswordTextField = true,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.inputFormatters,
      this.labelText,
      this.obscureText = true,
      this.validator})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      cursorColor: kGreen,
      style: kRegularTextStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: widget.textColor ?? Colors.white),
      controller: widget.controller,
      autofocus: widget.autoFocus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:
            kRegularTextStyle.copyWith(fontSize: 15, color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: kGreen)),
        hintText: widget.hintText,
        hintStyle: kRegularTextStyle.copyWith(
            color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal),
        suffixIcon: widget.isPasswordTextField
            ? GestureDetector(
                child: widget.obscureText
                    ? const Icon(Icons.visibility, color: kGreen)
                    : const Icon(Icons.visibility_off, color: Colors.grey),
                onTap: () => setState(() {
                  widget.obscureText = !widget.obscureText;
                }),
              )
            : null,
      ),
    );
  }
}
