import 'dart:math';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/services/loan_service.dart';
import 'package:trove/services/payment_service.dart';
import 'package:trove/services/shared_prefs.dart';

class LoansViewModel extends FormViewModel {
  bool isPaying = false;
  final _loanService = locator<LoanService>();
  final _storageService = locator<SharedPreferencesService>();
  final _snackBarService = locator<SnackbarService>();
  final _paymentService = locator<PaymentService>();

  final _numberFormatter = NumberFormat('#,###.##');

  void initialize() {
    _paymentService.initializePlugin();
    _snackBarService.registerCustomSnackbarConfig(
      variant: kTransactionSuccessful,
      config: SnackbarConfig(
        backgroundColor: kGreen,
        textColor: kTextColor,
        borderRadius: 1,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        barBlur: 0.6,
        messageColor: kTextColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }

  String _amount = '0';
  double _numberOfMonths = 6.0;
  double _monthlyPayments = 0.0;


  @override
  void setFormStatus() {}

  void takeLoan() async {
    setBusy(true);
    await _loanService.takeLoan(amount, numberOfMonths, _monthlyPayments);
    setBusy(false);
  }

  void payBackLoan(context) async {
    setPayingStatus(true);
    var paymentStatus = await _loanService.payLoan(context, balance);
    if (paymentStatus == true) {
      hasLoan = false;
      _snackBarService.showCustomSnackBar(
          message: kTransactionSuccessful, variant: kTransactionSuccessful);
    }
    setPayingStatus(false);
  }

  void setPayingStatus(bool value) {
    isPaying = value;
    notifyListeners();
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

  String get balance =>
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

  bool get hasLoan => _storageService.getBool(kHasLoan);

  set hasLoan(bool value) {
    _storageService.setBool(kHasLoan, value);
    notifyListeners();
  }

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
    calculateSchedule();
  }
}
