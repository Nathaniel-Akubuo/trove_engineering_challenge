import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/services/shared_prefs.dart';
import 'info_view.form.dart';

class InfoViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPreferencesService>();

  @override
  void setFormStatus() {}

  void save()async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    print(phoneNumberValue);
    print(passwordValue);
    _sharedPrefsService.setString(kPhoneNumber, phoneNumberValue!);
    if(passwordValue!.isNotEmpty){
      _sharedPrefsService.setString(kPassword, passwordValue!);
    }

    _navigationService.back();
    setBusy(false);
  }
}
