import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/size_utils.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function onTap;
  const CustomBottomNavbar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Theme(
      data: ThemeData(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Container(
          height: height * 0.066,
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(borderRadius: .circular(16)),
          margin: .symmetric(horizontal: width * 0.026),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.darkGreyColor,
            onTap: (index) {
              onTap(index);
            },
            currentIndex: index,
            type: .fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppAssets.homeIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkPrimaryColor,
                    .srcIn,
                  ),
                ),
                icon: SvgPicture.asset(AppAssets.homeIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppAssets.searchIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkPrimaryColor,
                    .srcIn,
                  ),
                ),
                icon: SvgPicture.asset(AppAssets.searchIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppAssets.exploreIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkPrimaryColor,
                    .srcIn,
                  ),
                ),
                icon: SvgPicture.asset(AppAssets.exploreIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppAssets.profileIcon,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkPrimaryColor,
                    .srcIn,
                  ),
                ),
                icon: SvgPicture.asset(AppAssets.profileIcon),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
