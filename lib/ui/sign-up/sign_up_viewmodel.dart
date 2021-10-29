import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/authentication_service.dart';

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  @override
  void setFormStatus() {}

  void signUp(String email,String phoneNumber, String password) async {
    setBusy(true);
    _authService.signUpWithEmail(email,phoneNumber, password);
    setBusy(false);
  }

  void navigateToSignIn() => _navigationService.navigateTo(Routes.signInView);
}
