import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/loans/widgets/loan_details_view.dart';
import 'package:trove/widgets/custom_textfield.dart';
import 'package:trove/widgets/rounded_button.dart';
import 'package:trove/widgets/white_circular_progress_indicator.dart';

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
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initialize();
      },
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            title: Text('Loans', style: kAppBarTextStyle),
            elevation: 0),
        body: model.hasLoan
            ? const LoanDetails()
            : Container(
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
                            text: 'Please note that you can borrow up to ',
                            children: [
                              TextSpan(
                                  text: '60%',
                                  style: kRegularTextStyle.copyWith(
                                      color: kGreen,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' of your portfolio value with a monthly interest rate of ',
                                  style: kRegularTextStyle.copyWith(
                                      color: Colors.black87)),
                              TextSpan(
                                  text: '2%.',
                                  style: kRegularTextStyle.copyWith(
                                      color: kGreen,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' Your current max amount is ',
                                  style: kRegularTextStyle.copyWith(
                                      color: Colors.black87)),
                              TextSpan(
                                  text: r'$' + model.maxAmountFormatted,
                                  style: kRegularTextStyle.copyWith(
                                      color: kGreen,
                                      fontWeight: FontWeight.bold)),
                            ],
                            style: kRegularTextStyle.copyWith(
                                color: Colors.black87)),
                      ), verticalSpaceMedium,
                      Card(
                        elevation: 5,
                        color: kBackgroundColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: kBorderRadius),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                        ),
                      ),
                      verticalSpaceMedium,
                      Form(
                        key: _formKey,
                        child: Card(
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                              borderRadius: kBorderRadius),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: amountController,
                                  onChanged: (value) => model.amount =
                                      value.isEmpty ? '0' : value,
                                  labelText: 'How much?',
                                  hintText:
                                      r'Max: $' + model.maxAmountFormatted,
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
                                  child: SfSlider(
                                    value: model.numberOfMonths,
                                    onChanged: (value) =>
                                        model.numberOfMonths = value,
                                    interval: 1,
                                    inactiveColor: kGreen.withOpacity(0.2),
                                    activeColor: kGreen,
                                    showLabels: true,
                                    min: 6.0,
                                    max: 12.0,
                                  ),
                                ),
                                verticalSpaceMedium,
                                RoundedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      model.takeLoan();
                                    }
                                  },
                                  height: 40,
                                  child: model.isBusy
                                      ? const WhiteCircularProgressIndicator()
                                      : Text(
                                          'TAKE OUT LOAN',
                                          style: kButtonTextStyle,
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                    borderRadius: kRoundedTopBorder, color: kLightGrey),
              ),
      ),
      viewModelBuilder: () => LoansViewModel(),
    );
  }
}
