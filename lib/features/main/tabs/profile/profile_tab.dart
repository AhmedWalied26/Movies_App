import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/main/tabs/profile/widgets/custom_column.dart';
import 'package:movies_app/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.darkBlackColor,
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: AppColors.greyColor,
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            AppAssets.profileImage8,
                            width: 118,
                            height: 118,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('John Safwat', style: AppStyles.bold20White),
                      ],
                    ),
                    CustomColumn(label_1: loc.watch_List, label_2: loc.history),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomElevatedButton(
                        onPressedButton2: () {},
                        title: loc.edit_Profile,
                        style: AppStyles.regular20Black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomElevatedButton(
                        isExitButton: true,
                        bgColor: AppColors.redColor,
                        onPressedButton2: () {},
                        title: loc.exit,
                        style: AppStyles.regular20White,
                        child: SvgPicture.asset(AppAssets.exitIcon),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.height(context) * 0.02),
              TabBar(
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                indicatorSize: .tab,
                tabs: [
                  Tab(
                    icon: const Icon(Icons.list, size: 40),
                    child: Text(loc.watch_List, style: AppStyles.bold18White),
                  ),
                  Tab(
                    icon: const Icon(Icons.folder, size: 40),
                    child: Text(loc.history, style: AppStyles.bold18White),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.darkBlackColor,
                      child: Center(
                        child: Image.asset(AppAssets.emptyListImage),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.darkBlackColor,
                      child: Center(
                        child: Image.asset(AppAssets.emptyListImage),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
