import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';

import 'loans_viewmodel.dart';
import 'loans_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'amount'),
])
class LoansView extends StatelessWidget with $LoansView {
  final _formKey = GlobalKey<FormState>();

  LoansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoansViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            title: Text('Loans', style: kAppBarTextStyle),
            elevation: 0),
        body: Container(
          padding: kMainPadding,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceRegular,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text:
                          'Please note that you can borrow up to 60% of your portfolio value. Your current max amount is ',
                      children: [
                        TextSpan(
                            text: r'$' + model.maxAmount.toString(),
                            style: kRegularTextStyle.copyWith(
                                color: kGreen, fontWeight: FontWeight.bold))
                      ],
                      style: kRegularTextStyle.copyWith(color: Colors.black87)),
                ),
                verticalSpaceMedium,
                Form(
                  key: _formKey,
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: kBorderRadius),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Loan Information',
                            style: kAppBarTextStyle.copyWith(
                                color: Colors.black87),
                          ),
                          verticalSpaceRegular,
                          CustomTextFormField.regular(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: amountController,
                            onChanged: (value) =>
                                model.amount = value.isEmpty ? '0' : value,
                            labelText: 'How much?',
                            hintText: r'Max : $' + model.maxAmount.toString(),
                            keyboardType: TextInputType.number,
                            textColor: Colors.black,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return 'Enter a valid amount';
                              } else if (v.isNotEmpty) {
                                if (double.parse(v) > model.maxAmount!) {
                                  return r'Your maximum loan amount is $' +
                                      model.maxAmount.toString();
                                }
                              }
                            },
                          ),
                          verticalSpaceMedium,
                          Text('How many months do you need it for?',
                              style: kRegularTextStyle.copyWith(
                                  fontSize: 15, color: Colors.grey)),
                          verticalSpaceSmall,
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 5),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0),
                            ),
                            child: Slider(
                              value: model.numberOfMonths,
                              onChanged: (double value) =>
                                  model.numberOfMonths = value,
                              divisions: 6,
                              inactiveColor: kGreen.withOpacity(0.2),
                              activeColor: kGreen,
                              label: model.numberOfMonths.toString(),
                              min: 6.0,
                              max: 12.0,
                            ),
                          ),
                          verticalSpaceMedium,
                          RoundedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                model.calculateSchedule();
                              }
                            },
                            height: 40,
                            child: Text(
                              'PROCEED',
                              style: kButtonTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Card(
                  elevation: 5,
                  color: kBackgroundColor,
                  shape:
                      const RoundedRectangleBorder(borderRadius: kBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Estimated Monthly Payments',
                            style: kAppBarTextStyle),
                        verticalSpaceSmall,
                        Text(
                          r'$' + model.monthlyPayments.toString(),
                          style: kRegularTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(
              borderRadius: kRoundedTopBorder, color: Colors.white),
        ),
      ),
      viewModelBuilder: () => LoansViewModel(),
    );
  }
}
