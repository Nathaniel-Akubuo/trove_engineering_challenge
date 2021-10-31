import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/services/shared_prefs.dart';

class AuthenticationService {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferencesService>();

  void signUpWithEmail(
      String email, String phoneNumber, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _storageService.setString(kEmail, email);
    _storageService.setString(kPhoneNumber, phoneNumber);
    _storageService.setString(kPassword, password);

    _storageService.setBool(kAuthenticated, true);
    _navigationService.navigateTo(Routes.dashboardView);
  }

  Future<void> signInWithEmail(
      BuildContext context, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == _storageService.getString(kEmail) &&
        password == _storageService.getString(kPassword)) {
      _navigationService.navigateTo(Routes.dashboardView);
    } else {
      var snackBar = SnackBar(
        content: Text(
          'Invalid credentials',
          style: kRegularTextStyle.copyWith(fontSize: 15),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
