// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:movies_app/utils/app_assets.dart';
// import 'package:movies_app/utils/size_utils.dart';
// import 'package:movies_app/utils/app_colors.dart';

// class CustomBottomNavbar extends StatelessWidget {
//   final int index;
//   final Function(int) onTap;

//   const CustomBottomNavbar({
//     super.key,
//     required this.index,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final height = context.height;
//     final width = context.width;

//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Theme(
//       data: Theme.of(context).copyWith(
//         splashFactory: NoSplash.splashFactory,
//         highlightColor: Colors.transparent,
//       ),
//       child: SafeArea(
//         top: false,
//         child: Container(
//           height: kBottomNavigationBarHeight + 4,
//           clipBehavior: .antiAlias,
//           decoration: BoxDecoration(borderRadius: .circular(16)),
//           margin: const .symmetric(horizontal: 12),
//           child: BottomNavigationBar(
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             backgroundColor: AppColors.darkGreyColor,
//             onTap: (index) {
//               onTap(index);
//             },
//             currentIndex: index,
//             type: .fixed,
//             items: [
//               BottomNavigationBarItem(
//                 label: '',
//                 activeIcon: SvgPicture.asset(
//                   AppAssets.homeIcon,
//                   colorFilter: ColorFilter.mode(AppColors.primaryColor, .srcIn),
//                 ), icon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.homeIcon
//                         : AppAssets.unhomeIconLight
//                         ,)),

//                 BottomNavigationBarItem(
//                   activeIcon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.selectedsearchDarkIcon
//                         : AppAssets.searchDark,
//                   ),
//                   icon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.searchDark
//                         : AppAssets.unsearchLight,
//                   ),
//                   label: '',
//                 ),

//                 BottomNavigationBarItem(
//                   activeIcon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.selectedexploreDarkIcon
//                         : AppAssets.exploreIcon,
//                   ),
//                   icon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.exploreIcon
//                         : AppAssets.unexploreIcon,
//                   ),
//                   label: '',
//                 ),

//                 BottomNavigationBarItem(
//                   activeIcon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.selectedprofileDarkIcon
//                         : AppAssets.profileIcon,
//                   ),
//                   icon: SvgPicture.asset(
//                     isDark
//                         ? AppAssets.profileIcon
//                         : AppAssets.unprofileIcon,
//                   ),
//                   label: '',
//                 ),
//               ],
//             ),
//           ),
//         ),

//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/utils/app_colors.dart';

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
        top: false,
        // Force LTR so the tab order stays the same in Arabic and English.
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            height: kBottomNavigationBarHeight + 4,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: isDark
                  ? AppColors.navBarDark
                  : AppColors.navBarLight,
              selectedItemColor: isDark
                  ? AppColors.navBarSelectedDark
                  : AppColors.navBarSelectedLight,
              unselectedItemColor: isDark
                  ? AppColors.navBarUnselectedDark
                  : AppColors.navBarUnselectedLight,
              onTap: (index) {
                onTap(index);
              },
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              items: [
                // BottomNavigationBarItem(
                //   label: '',
                //   activeIcon: SvgPicture.asset(
                //     AppAssets.unhomeIconLight,
                //     colorFilter: ColorFilter.mode(
                //       AppColors.primaryColor,
                //       BlendMode.srcIn,
                //     ),
                //   ),
                //   icon: SvgPicture.asset(
                //     isDark ? AppAssets.unhomeIconLight : AppAssets.homeIcon,
                //   ),
                // ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedhomeDarkIcon
                        : AppAssets.homeIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark ? AppAssets.homeIcon : AppAssets.unhomeIconLight,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  label: '',
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedsearchDarkIcon
                        : AppAssets.searchDark,
                  ),
                  icon: SvgPicture.asset(
                    isDark ? AppAssets.searchDark : AppAssets.unsearchLight,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedexploreDarkIcon
                        : AppAssets.exploreIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark ? AppAssets.exploreIcon : AppAssets.unexploreIcon,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  activeIcon: SvgPicture.asset(
                    isDark
                        ? AppAssets.selectedprofileDarkIcon
                        : AppAssets.profileIcon,
                  ),
                  icon: SvgPicture.asset(
                    isDark ? AppAssets.profileIcon : AppAssets.unprofileIcon,
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
