// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PhoneNumberValueKey = 'phoneNumber';
const String PasswordValueKey = 'password';
const String ConfirmPasswordValueKey = 'confirmPassword';

mixin $InfoView on StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            PhoneNumberValueKey: phoneNumberController.text,
            PasswordValueKey: passwordController.text,
            ConfirmPasswordValueKey: confirmPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];
  String? get passwordValue => this.formValueMap[PasswordValueKey];
  String? get confirmPasswordValue =>
      this.formValueMap[ConfirmPasswordValueKey];

  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
  bool get hasPassword => this.formValueMap.containsKey(PasswordValueKey);
  bool get hasConfirmPassword =>
      this.formValueMap.containsKey(ConfirmPasswordValueKey);
}

extension Methods on FormViewModel {}
