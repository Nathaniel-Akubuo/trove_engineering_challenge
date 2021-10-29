import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/sign-up/sign_up_viewmodel.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';
import 'sign_up.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'phoneNumber'),
    FormTextField(name: 'password'),
    FormTextField(name: 'confirmPassword'),
  ],
)
class SignUpView extends StatelessWidget with $SignUpView {
  final _formKey = GlobalKey<FormState>();

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) =>
            Scaffold(
              body: SingleChildScrollView(
                padding: kMainPadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceLarge,
                      Text('Welcome to Trove', style: kTitleTextStyle),
                      verticalSpaceSmall,
                      Text('Create an account', style: kRegularTextStyle),
                      verticalSpaceLarge,
                      CustomTextFormField.regular(
                          validator: (value) {
                            if (!emailRegEx.hasMatch(value!)) {
                              return 'Enter a valid email';
                            }
                          },
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email Address'),
                      verticalSpaceRegular,
                      CustomTextFormField.regular(
                          controller: phoneNumberController,
                          validator: (v) {
                            if (v!.length < 11) {
                              return 'Not a valid phone number';
                            }
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          labelText: 'Phone Number'),
                      verticalSpaceRegular,
                      CustomTextFormField.password(
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Password must be at least 4 characters';
                            }
                          },
                          labelText: 'Password'),
                      verticalSpaceRegular,
                      CustomTextFormField.password(
                          controller: confirmPasswordController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                          },
                          labelText: 'Confirm Password'),
                      verticalSpaceLarge,
                      RoundedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              model.signUp(emailController.text,
                                  phoneNumberController.text,
                                  passwordController.text);
                            }
                          },
                          child: model.isBusy
                              ? const Center(
                            child: CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation(Colors.white)),
                          )
                              : Text('SIGN IN TO TROVE',
                              style: kButtonTextStyle)),
                      verticalSpaceRegular,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Don't have an account yet? ",
                              children: [
                                TextSpan(
                                    text: 'Get Started',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => model.navigateToSignIn(),
                                    style: kRegularTextStyle.copyWith(
                                        color: kGreen,
                                        fontWeight: FontWeight.bold))
                              ],
                              style: kRegularTextStyle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SignUpViewModel());
  }
}
