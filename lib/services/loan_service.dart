import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/services/payment_service.dart';
import 'package:trove/services/shared_prefs.dart';

class LoanService {
  final _paymentService = locator<PaymentService>();
  final _storageService = locator<SharedPreferencesService>();
  final _snackBarService = locator<SnackbarService>();

  Future takeLoan(amount, numberOfMonths, monthlyPayments) async {
    await Future.delayed(const Duration(seconds: 1));
    _storageService.setDouble(kLoanAmount, double.parse(amount));
    _storageService.setDouble(kLoanPeriod, numberOfMonths);
    _storageService.setDouble(kLoanSchedule, monthlyPayments);
    _storageService.setBool(kHasLoan, true);
    _snackBarService.showCustomSnackBar(
        message: kTransactionSuccessful, variant: kTransactionSuccessful);
  }

  Future<bool> payLoan(context, amount) async {
    var paymentStatus = await _paymentService.chargeCard(
        context: context,
        amount: (double.parse(amount.replaceAll(',', '')) * 100).toInt(),
        email: _storageService.getString(kEmail)!);
    if (paymentStatus == true) {
      return true;
    } else {
      return false;
    }
  }
}
