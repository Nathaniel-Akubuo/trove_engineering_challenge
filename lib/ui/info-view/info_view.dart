import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';

import 'info_viewmodel.dart';
import 'info_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class InfoView extends StatelessWidget with $InfoView {
  final String email;
  final String phoneNumber;

  InfoView({Key? key, required this.email, required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return ViewModelBuilder<InfoViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: kBackgroundColor,
                  title: Text('Update Profile Info', style: kAppBarTextStyle),
                  elevation: 0),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: 375,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceLarge,
                              Expanded(
                                child: CustomTextFormField.regular(
                                  textColor: Colors.black,
                                  controller: phoneNumberController,
                                  labelText: 'Enter Phone Number',
                                ),
                              ),
                              verticalSpaceSmall,
                              Expanded(
                                child: CustomTextFormField.password(
                                  controller: passwordController,
                                  labelText: 'Enter New Password',
                                  textColor: Colors.black,
                                ),
                              ),
                              verticalSpaceSmall,
                              Expanded(
                                child: CustomTextFormField.password(
                                  controller: confirmPasswordController,
                                  labelText: 'Confirm New Password',
                                  textColor: Colors.black,
                                ),
                              ),
                              RoundedButton(
                                onPressed: model.save,
                                child: model.isBusy
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'SAVE INFO',
                                            style: kAppBarTextStyle,
                                          ),
                                          const Icon(Icons.arrow_forward,
                                              color: Colors.white)
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: SizedBox(
                        height: 150,
                        width: mediaQuery.width * 0.8,
                        child: Card(
                          elevation: 5,
                          color: kBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMAIL',
                                  style: kAppBarTextStyle.copyWith(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  email,
                                  style:
                                      kAppBarTextStyle.copyWith(fontSize: 14),
                                ),
                                verticalSpaceRegular,
                                Text(
                                  'PHONE NUMBER',
                                  style: kAppBarTextStyle.copyWith(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  phoneNumber,
                                  style:
                                      kAppBarTextStyle.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => InfoViewModel());
  }
}
