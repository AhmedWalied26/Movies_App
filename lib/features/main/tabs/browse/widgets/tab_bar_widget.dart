import 'package:flutter/material.dart';
import 'package:movies_app/features/main/widgets/movie_card_item.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/movie_card_item.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final tabs = [
      loc.action,
      loc.horror,
      loc.comedy,
      loc.drama,
      loc.sci_fi,
      loc.fantasy,
      loc.romance,
      loc.crime,
      loc.adventure,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SingleChildScrollView(
            padding: .only(bottom: context.height * 0.1),
            child: Column(
              children: [
                TabBar(
                  labelPadding: .symmetric(horizontal: 6),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.transparentColor,
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelStyle: AppStyles.bold20DarkBlack,
                  unselectedLabelStyle: AppStyles.bold20Primary,
                  tabs: tabs.map((label) {
                    return Tab(
                      child: Container(
                        padding: .symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(label),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: SizeConfig.height(context)*0.025),
                SizedBox(height: 25),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: .symmetric(horizontal: 8),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return MovieCardItem();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}