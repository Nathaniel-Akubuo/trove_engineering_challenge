import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/loans/loans_viewmodel.dart';
import 'package:trove/widgets/rounded_button.dart';

import 'loan_info_widget.dart';

class LoanDetails extends ViewModelWidget<LoansViewModel> {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoansViewModel viewModel) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: kMainPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoanInfoWidget(
                    description: 'LOAN AMOUNT',
                    value: r'$' + viewModel.loanAmount),
                LoanInfoWidget(
                    description: 'NUMBER OF PAYMENTS LEFT',
                    value: viewModel.loanPeriod!.toStringAsFixed(0)),
                LoanInfoWidget(
                    description: 'BALANCE', value: r'$' + viewModel.amountLeft),
              ],
            ),
          ),
        ),
        verticalSpaceLarge,
        Container(
          padding: kMainPadding,
          height: screenSize.height * 0.6,
          child: Column(
            children: [
              verticalSpaceLarge,
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
                        r'$' + viewModel.monthlyPayments.toString(),
                        style: kRegularTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  child: RoundedButton(
                      child: Text(
                    'PAY BACK',
                    style: kButtonTextStyle,
                  )),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
          decoration: const BoxDecoration(
              color: kLightGrey, borderRadius: kRoundedTopBorder),
        ),
      ],
    );
  }
}
