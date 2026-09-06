import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/size_utils.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Container(
          height: height * 0.066,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.026,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,

              onTap: onTap,
              currentIndex: index,
              type: BottomNavigationBarType.fixed,

              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedhomeDarkIcon
                        : AppAssets.homeIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark
                        ? AppAssets.homeIcon
                        : AppAssets.unhomeIconLight,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedsearchDarkIcon
                        : AppAssets.searchDark,
                  ),
                  icon: SvgPicture.asset(
                    isDark
                        ? AppAssets.searchDark
                        : AppAssets.unsearchLight,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedexploreDarkIcon
                        : AppAssets.exploreIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark
                        ? AppAssets.exploreIcon
                        : AppAssets.unexploreIcon,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedprofileDarkIcon
                        : AppAssets.profileIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark
                        ? AppAssets.profileIcon
                        : AppAssets.unprofileIcon,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}