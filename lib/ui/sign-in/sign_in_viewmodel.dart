import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/services/authentication_service.dart';

class SignInViewModel extends FormViewModel {
  final _authService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {}

  void signIn(context, String email, String password) async {
    setBusy(true);
    await _authService.signInWithEmail(context, email, password);
    setBusy(false);
  }

  void navigateToSignUp() => _navigationService.navigateTo(Routes.signUpView);
}
