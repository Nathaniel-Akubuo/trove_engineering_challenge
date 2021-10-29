import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/sign-in/sign_in_viewmodel.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';
import 'sign_in.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class SignInView extends StatelessWidget with $SignInView {
  final _formKey = GlobalKey<FormState>();

  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
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
                      Text('Sign in to continue', style: kRegularTextStyle),
                      verticalSpaceLarge,
                      CustomTextFormField.regular(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (!emailRegEx.hasMatch(value!)) {
                            return 'Enter a valid email';
                          }
                        },
                      ),
                      verticalSpaceRegular,
                      CustomTextFormField.password(
                        controller: passwordController,
                        labelText: 'Password',
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Password must be at least 4 characters';
                          }
                        },
                      ),
                      verticalSpaceLarge,
                      RoundedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            model.signIn(context, emailController.text,
                                passwordController.text);
                          }
                        },
                        child: model.isBusy
                            ? const Center(
                                child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white)),
                              )
                            : Text('SIGN IN TO TROVE', style: kButtonTextStyle),
                      ),
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
                                      ..onTap = () => model.navigateToSignUp(),
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
        viewModelBuilder: () => SignInViewModel());
  }
}
