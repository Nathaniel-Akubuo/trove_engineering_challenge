import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/models/portfolio_model.dart';
import 'package:trove/services/drawer_animation_service.dart';
import 'package:trove/services/shared_prefs.dart';

class DashboardViewModel extends DrawerAnimationService {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferencesService>();
  final List<PortfolioModel> _portfolioList = [];
  double _portfolioValue = 0.0;
  final _numberFormatter = NumberFormat("#,###.###");

  void initializeFields() {
    for (var json in kPortfolio) {
      _portfolioList.add(PortfolioModel.fromJson(json));
    }
    for (var item in _portfolioList) {
      _portfolioValue += item.equityValue!;
    }
    _storageService.setDouble(kWalletBalance, _portfolioValue);
  }

  String formatNumber(double number) {
    return _numberFormatter.format(number);
  }

  void navigateToPortfolio() {
    _navigationService.navigateTo(Routes.portfolioView);
  }

  void navigateToLoans() {
    _navigationService.navigateTo(Routes.loansView);
  }

  void navigateToAccountSettings() {
    _navigationService.navigateTo(Routes.accountSettingsView);
  }

  void signOut() => _navigationService.replaceWith(Routes.signInView);

  String get walletBalance => _numberFormatter.format(_portfolioValue);

  List<PortfolioModel> get portfolioList => _portfolioList;
}
