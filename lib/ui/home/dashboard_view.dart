import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/constants/styles.dart';
import 'package:trove/constants/ui_helpers.dart';
import 'package:trove/ui/home/drawer.dart';

import 'dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onModelReady: (model) => model.initializeFields(),
        builder: (context, model, child) => Stack(
              children: [
                const DrawerView(),
                GestureDetector(
                  onTap: model.isDrawerOpen() ? model.closeDrawer : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    transform: Matrix4.translationValues(
                        model.xOffset, model.yOffset, 0)
                      ..scale(model.scale),
                    child: ClipRRect(
                      borderRadius: model.isDrawerOpen()
                          ? BorderRadius.circular(15)
                          : BorderRadius.zero,
                      child: Scaffold(
                        backgroundColor: kLightGrey,
                        appBar: AppBar(
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(75),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'WALLET BALANCE',
                                        style: kRegularTextStyle.copyWith(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        r'$1,000,000',
                                        style: kRegularTextStyle.copyWith(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'MY PORTFOLIO VALUE',
                                        style: kRegularTextStyle.copyWith(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        r'$' + model.walletBalance,
                                        style: kRegularTextStyle.copyWith(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          backgroundColor: kBackgroundColor,
                          centerTitle: true,
                          title: Text('Dashboard', style: kAppBarTextStyle),
                          elevation: 0,
                          leading: IconButton(
                              splashColor: Colors.grey,
                              icon: const Icon(FontAwesomeIcons.alignLeft,
                                  color: Colors.white),
                              onPressed: model.isDrawerOpen()
                                  ? model.closeDrawer
                                  : model.openDrawer),
                        ),
                        body: Padding(
                          padding: kMainPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceRegular,
                              Text('MY PORTFOLIO POSITIONS',
                                  style: kRegularTextStyle.copyWith(
                                      color: Colors.black)),
                              verticalSpaceRegular,
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const Divider(color: Colors.grey),
                                  itemBuilder: (context, index) {
                                    var currentItem =
                                        model.portfolioList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                  currentItem.image!),
                                            ),
                                          ),
                                          horizontalSpaceSmall,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                currentItem.symbol!,
                                                style:
                                                    kAppBarTextStyle.copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                              ),
                                              Text(
                                                currentItem.name!,
                                                style:
                                                    kRegularTextStyle.copyWith(
                                                        color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            r'$' +
                                                model.formatNumber(
                                                    currentItem.equityValue!),
                                            style: kAppBarTextStyle.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: model.portfolioList.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        viewModelBuilder: () => locator<DashboardViewModel>());
  }
}
