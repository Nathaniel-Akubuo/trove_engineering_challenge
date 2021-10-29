import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/account-settings/widgets/custom_list_tile.dart';

import 'account_settings_viewmodel.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSettingsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: kBackgroundColor,
                  title: Text('My Profile', style: kAppBarTextStyle),
                  elevation: 0),
              body: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      padding: kMainPadding,
                      width: double.infinity,
                      height: 1000,
                      child: Column(
                        children: [
                          verticalSpaceLarge,
                          Text('Ope',
                              style: kAppBarTextStyle.copyWith(
                                  color: Colors.black)),
                          verticalSpaceLarge,
                          Card(
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                                borderRadius: kBorderRadius),
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Profile Information',
                                        style: kAppBarTextStyle.copyWith(
                                            color: Colors.black87),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        icon: const Icon(Icons.edit,
                                            color: Colors.black87),
                                        onPressed:model.navigateToEditInfoScreen,
                                      )
                                    ],
                                  ),
                                  verticalSpaceRegular,
                                  CustomListTile(
                                    iconData: Icons.email,
                                    title: 'Email',
                                    subtitle: model.email,
                                  ),
                                  CustomListTile(
                                    iconData: Icons.phone,
                                    title: 'Mobile Number',
                                    subtitle: model.phoneNumber,
                                  ),
                                  CustomListTile(
                                    onTap: model.navigateToEditInfoScreen,
                                    iconData: Icons.lock,
                                    title: 'Change Password',
                                    subtitle: 'Tap to change password',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                          color: kLightGrey, borderRadius: kRoundedTopBorder),
                    ),
                    const Positioned(
                      top: 60,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/ope.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => AccountSettingsViewModel());
  }
}
