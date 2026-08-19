// import 'package:country_flags/country_flags.dart';
// import 'package:flutter/material.dart';
// import 'package:movies_app/utils/app_colors.dart';

// class Flag extends StatelessWidget {
//   final String countryCode;
//   final double size;

//   const Flag({super.key, required this.countryCode, this.size = 19});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: AppColors.primaryColor, width: 1),
//       ),
//       child: ClipOval(
//         child: CountryFlag.fromCountryCode(
//           countryCode,
//           theme: ImageTheme(width: size, height: size, shape: const Circle()),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:movies_app/utils/app_assets.dart';


// class Flag extends StatelessWidget {
//   final String countryCode;
//   final double size;

//   const Flag({
//     super.key,
//     required this.countryCode,
//     required this.size,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       countryCode == 'US' ? AppAssets.enIcon : AppAssets.arIcon,
//       width: size,
//       height: size,
//       fit: BoxFit.cover,
//     );
//   }
// }