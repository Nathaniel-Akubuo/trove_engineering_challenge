import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/app/app.router.dart';
import 'package:trove/constants/constants.dart';
import 'package:trove/models/portfolio_model.dart';
import 'package:trove/services/drawer_animation_service.dart';

class DashboardViewModel extends DrawerAnimationService {
  final _navigationService = locator<NavigationService>();
  final List<PortfolioModel> _portfolioList = [];
  double _walletBalance = 0.0;
  final _numberFormatter = NumberFormat("#,###.###");

  void initializeFields() {
    for (var json in kPortfolio) {
      _portfolioList.add(PortfolioModel.fromJson(json));
    }
    for (var item in _portfolioList) {
      _walletBalance += item.equityValue!;
    }
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

  String get walletBalance => _numberFormatter.format(_walletBalance);

  List<PortfolioModel> get portfolioList => _portfolioList;
}
