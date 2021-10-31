// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/account-settings/account_settings_view.dart';
import '../ui/home/dashboard_view.dart';
import '../ui/home/drawer.dart';
import '../ui/info-view/info_view.dart';
import '../ui/loans/loans_view.dart';
import '../ui/portfolio/portfolio_view.dart';
import '../ui/sign-in/sign_in.dart';
import '../ui/sign-up/sign_up.dart';

class Routes {
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String dashboardView = '/dashboard-view';
  static const String drawerView = '/drawer-view';
  static const String portfolioView = '/portfolio-view';
  static const String loansView = '/loans-view';
  static const String accountSettingsView = '/account-settings-view';
  static const String infoView = '/info-view';
  static const all = <String>{
    signInView,
    signUpView,
    dashboardView,
    drawerView,
    portfolioView,
    loansView,
    accountSettingsView,
    infoView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.drawerView, page: DrawerView),
    RouteDef(Routes.portfolioView, page: PortfolioView),
    RouteDef(Routes.loansView, page: LoansView),
    RouteDef(Routes.accountSettingsView, page: AccountSettingsView),
    RouteDef(Routes.infoView, page: InfoView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SignInView: (data) {
      var args = data.getArgs<SignInViewArguments>(
        orElse: () => SignInViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInView(key: args.key),
        settings: data,
      );
    },
    SignUpView: (data) {
      var args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(key: args.key),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    DrawerView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DrawerView(),
        settings: data,
      );
    },
    PortfolioView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PortfolioView(),
        settings: data,
      );
    },
    LoansView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoansView(),
        settings: data,
      );
    },
    AccountSettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AccountSettingsView(),
        settings: data,
      );
    },
    InfoView: (data) {
      var args = data.getArgs<InfoViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => InfoView(
          key: args.key,
          email: args.email,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignInView arguments holder class
class SignInViewArguments {
  final Key? key;
  SignInViewArguments({this.key});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key? key;
  SignUpViewArguments({this.key});
}

/// InfoView arguments holder class
class InfoViewArguments {
  final Key? key;
  final String email;
  final String phoneNumber;
  InfoViewArguments({this.key, required this.email, required this.phoneNumber});
}
