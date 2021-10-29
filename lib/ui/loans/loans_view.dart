import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'loans_viewmodel.dart';

class LoansView extends StatelessWidget {
  const LoansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoansViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(),
        ),
        viewModelBuilder: () => LoansViewModel());
  }
}
