import 'dart:math';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/services/shared_prefs.dart';

class LoansViewModel extends FormViewModel {
  final _storageService = locator<SharedPreferencesService>();
  final _snackBarService = locator<SnackbarService>();
  final _numberFormatter = NumberFormat('#,###.##');

  LoanModel? _loanModel;
  String _amount = '0';
  double _numberOfMonths = 6.0;
  double _monthlyPayments = 0.0;

  LoanModel? get loanModel => _loanModel;

  @override
  void setFormStatus() {}

  void takeLoan() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    _loanModel =
        LoanModel(amount: double.parse(amount), period: numberOfMonths);
    _snackBarService.showSnackbar(message: 'Transaction Successful!');
    _storageService.setDouble(kLoanAmount, double.parse(amount));
    _storageService.setDouble(kLoanPeriod, numberOfMonths);
    _storageService.setDouble(kLoanSchedule, _monthlyPayments);
    setBusy(false);
  }

  void calculateSchedule() {
    double principal = double.parse(_amount);
    double monthlyInterestRate = 2 / 100;
    if (principal <= maxAmount!) {
      var exp = pow(1 + monthlyInterestRate, numberOfMonths);
      _monthlyPayments = principal / ((exp - 1) / (monthlyInterestRate * exp));
      notifyListeners();
    }
  }

  double? get maxAmount => _storageService.getDouble(kWalletBalance)! * 0.6;

  String get loanAmount =>
      _numberFormatter.format(_storageService.getDouble(kLoanAmount));

  String get loanSchedule =>
      _numberFormatter.format(_storageService.getDouble(kLoanSchedule));

  String get amountLeft =>
      _numberFormatter.format(_storageService.getDouble(kLoanSchedule)! *
          _storageService.getDouble(kLoanPeriod)!);

  double? get loanPeriod => _storageService.getDouble(kLoanPeriod);

  String get maxAmountFormatted =>
      _numberFormatter.format(_storageService.getDouble(kWalletBalance)! * 0.6);

  double get numberOfMonths => _numberOfMonths;

  set numberOfMonths(double value) {
    _numberOfMonths = value;
    calculateSchedule();
    notifyListeners();
  }

  get monthlyPayments => _numberFormatter.format(_monthlyPayments);

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
    calculateSchedule();
  }
}
