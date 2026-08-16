import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/main/tabs/profile/widgets/custom_column.dart';
import 'package:movies_app/features/main/tabs/profile/widgets/custom_container.dart';
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
      backgroundColor: AppColors.darkGreyColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
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
                            width: 80,
                            height: 80,
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
              CustomContainer(label_1: loc.edit_Profile, label_2: loc.exit),
              SizedBox(height: SizeConfig.height(context) * 0.02),
              TabBar(
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
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
                child: Container(
                  width: double.infinity,
                  color: AppColors.blackColor,
                  child: Center(
                    child: SvgPicture.asset(AppAssets.popCornImage),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
