import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/services/drawer_animation_service.dart';
import 'package:trove/services/shared_prefs.dart';

class AccountSettingsViewModel extends DrawerAnimationService {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPreferencesService>();

  void navigateToEditInfoScreen() => _navigationService.navigateTo(
      Routes.infoView,
      arguments: InfoViewArguments(email: email!, phoneNumber: phoneNumber!));

  String? get email => _sharedPrefsService.getString(kEmail);

  String? get phoneNumber => _sharedPrefsService.getString(kPhoneNumber);

  String? get password => _sharedPrefsService.getString(kPassword);
}
