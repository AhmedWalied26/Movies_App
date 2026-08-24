import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/main/tabs/profile/widgets/custom_column.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int profileRefreshKey = 0;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final loc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      key: ValueKey(profileRefreshKey),
      future: user == null
          ? null
          : AuthService.instance.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: AppColors.darkBlackColor,
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final profile = snapshot.data?.data() ?? <String, dynamic>{};
        return Scaffold(
      backgroundColor: AppColors.darkBlackColor,
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: AppColors.greyColor,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.height(context) * 0.05),
              Padding(
                padding: EdgeInsets.all(width * 0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            (profile['avatar'] as String?) ??
                                AppAssets.profileImage8,
                            height: height * 0.118,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (profile['name'] as String?) ??
                              user?.displayName ??
                              '',
                          style: AppStyles.bold20White,
                        ),
                      ],
                    ),
                    CustomColumn(label_1: loc.watch_List, label_2: loc.history),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomElevatedButton(
                        onPressedButton2: () async {
                          final updated = await Navigator.pushNamed(
                            context,
                            AppRoutes.updateProfileScreen,
                          );
                          if (updated == true && mounted) {
                            setState(() => profileRefreshKey++);
                          }
                        },
                        title: loc.edit_Profile,
                        style: AppStyles.regular20White,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomElevatedButton(
                        isExitButton: true,
                        bgColor: AppColors.redColor,
                        onPressedButton2: () async {
                          await AuthService.instance.signOut();
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.loginScreen,
                              (route) => false,
                            );
                          }
                        },
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
                labelPadding: .only(bottom: height * 0.012),
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
                      color: AppColors.blackColor,
                      child: Center(
                        child: Image.asset(AppAssets.emptyListImage),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.blackColor,
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
      },
    );
  }
}
