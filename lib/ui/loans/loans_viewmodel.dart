import 'dart:math';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/services/shared_prefs.dart';

class LoansViewModel extends FormViewModel {
  final _storageService = locator<SharedPreferencesService>();
  final _numberFormatter = NumberFormat('#,###.##');

  LoanModel? _loanModel;
  String _amount = '0';
  double _numberOfMonths = 6.0;
  double _monthlyPayments = 0.0;

  LoanModel? get loanModel => _loanModel;

  @override
  void setFormStatus() {}

  setLoan() {}

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
