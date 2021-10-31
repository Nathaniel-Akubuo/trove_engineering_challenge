import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/home/widgets/custom_list_tile.dart';
import 'package:trove/widgets/rounded_button.dart';

import 'dashboard_view_model.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              padding: kMainPadding,
              width: model.xOffset,
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Card(
                    elevation: 5,
                    color: kLightBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/ope.png'),
                          ),
                          horizontalSpaceSmall,
                          Text('Ope', style: kAppBarTextStyle)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: kMainPadding,
                    child: Column(
                      children: [
                        verticalSpaceRegular,
                        CustomListTile(
                            onTap: model.closeDrawer,
                            iconData: Icons.dashboard,
                            title: 'Dashboard'),
                        verticalSpaceSmall,
                        CustomListTile(
                            onTap: model.navigateToLoans,
                            iconData: Icons.local_atm,
                            title: 'Loans'),
                        verticalSpaceSmall,
                        CustomListTile(
                            onTap: model.navigateToAccountSettings,
                            iconData: Icons.settings,
                            title: 'Account Settings'),
                      ],
                    ),
                  ),
                  verticalSpaceLarge,
                  RoundedButton(
                    onPressed: model.signOut,
                    height: 45,
                    child: Text(
                      'SIGN OUT',
                      style: kAppBarTextStyle,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<DashboardViewModel>());
  }
}
