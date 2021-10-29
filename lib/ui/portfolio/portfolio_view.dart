import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/ui/portfolio/portfolio_viewmodel.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PortfolioViewModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => PortfolioViewModel());
  }
}
