import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trove/services/authentication_service.dart';
import 'package:trove/services/drawer_animation_service.dart';
import 'package:trove/services/loan_service.dart';
import 'package:trove/services/payment_service.dart';
import 'package:trove/services/shared_prefs.dart';
import 'package:trove/ui/account-settings/account_settings_view.dart';
import 'package:trove/ui/account-settings/account_settings_viewmodel.dart';
import 'package:trove/ui/dashboard/dashboard_view.dart';
import 'package:trove/ui/dashboard/dashboard_view_model.dart';
import 'package:trove/ui/dashboard/drawer.dart';
import 'package:trove/ui/info-view/info_view.dart';
import 'package:trove/ui/loans/loans_view.dart';
import 'package:trove/ui/portfolio/portfolio_view.dart';
import 'package:trove/ui/sign-in/sign_in.dart';
import 'package:trove/ui/sign-up/sign_up.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: DrawerView),
    MaterialRoute(page: PortfolioView),
    MaterialRoute(page: LoansView),
    MaterialRoute(page: AccountSettingsView),
    MaterialRoute(page: InfoView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DashboardViewModel),
    LazySingleton(classType: AccountSettingsViewModel),
    LazySingleton(classType: DrawerAnimationService),
    LazySingleton(classType: PaymentService),
    LazySingleton(classType: LoanService),
    Presolve(
        classType: SharedPreferencesService,
        presolveUsing: SharedPreferences.getInstance),
  ],
)
class AppSetup {}
