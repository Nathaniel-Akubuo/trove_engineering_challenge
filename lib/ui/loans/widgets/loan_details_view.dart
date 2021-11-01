import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/loans/loans_viewmodel.dart';
import 'package:trove/widgets/rounded_button.dart';
import 'package:trove/widgets/white_circular_progress_indicator.dart';

import 'loan_info_widget.dart';

class LoanDetails extends ViewModelWidget<LoansViewModel> {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoansViewModel viewModel) {
    return Padding(
      padding: kMainPadding,
      child: Column(
        children: [
          LoanInfoWidget(
              description: 'LOAN AMOUNT', value: r'$' + viewModel.loanAmount),
          verticalSpaceRegular,
          LoanInfoWidget(
              description: 'NUMBER OF PAYMENTS LEFT',
              value: viewModel.loanPeriod!.toStringAsFixed(0)),
          verticalSpaceRegular,
          LoanInfoWidget(
              description: 'BALANCE', value: r'$' + viewModel.amountLeft),
          verticalSpaceRegular,
          LoanInfoWidget(
              description: 'YOUR ESTIMATED MONTHLY PAYMENTS',
              value: r'$' + viewModel.monthlyPayments.toString()),
          verticalSpaceRegular,
          const Spacer(),
          RoundedButton(
            onPressed: () => viewModel.payBackLoan(context),
            child: viewModel.isPaying
                ? const WhiteCircularProgressIndicator()
                : Text('PAY BACK', style: kButtonTextStyle),
          ),
        ],
      ),
    );
  }
}
