// import 'package:flutter/material.dart';
// import 'package:movies/features/auth/login/widgets/flags.dart';
// import 'package:movies/utils/app_colors.dart';

// class LanguageSwitcher extends StatelessWidget {
//   final Locale selectedLocale;
//   final ValueChanged<Locale> onLanguageChanged;

//   const LanguageSwitcher({
//     super.key,
//     required this.selectedLocale,
//     required this.onLanguageChanged,
//   });

//   bool get isEnglish => selectedLocale.languageCode == 'en';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 47,
//       height: 21,
//       padding: const EdgeInsets.all(1.5),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: AppColors.primaryColor,
//           width: 1.2,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Stack(
//         children: [
//           AnimatedAlign(
//             duration: const Duration(milliseconds: 200),
//             curve: Curves.easeInOut,
//             alignment:
//                 isEnglish ? Alignment.centerLeft : Alignment.centerRight,
//             child: Container(
//               width: 18,
//               height: 18,
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryColor,
//                 shape: BoxShape.circle,
//               ),
//               padding: const EdgeInsets.all(2),
//               child: Flag(
//                 countryCode: isEnglish ? 'US' : 'EG',
//                 size: 14,
//               ),
//             ),
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: () {
//                   onLanguageChanged(const Locale('en'));
//                 },
//                 child: SizedBox(
//                   width: 20,
//                   height: 18,
//                   child: Center(
//                     child: Flag(
//                       countryCode: 'US',
//                       size: 14,
//                     ),
//                   ),
//                 ),
//               ),

//               GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: () {
//                   onLanguageChanged(const Locale('ar'));
//                 },
//                 child: SizedBox(
//                   width: 20,
//                   height: 18,
//                   child: Center(
//                     child: Flag(
//                       countryCode: 'EG',
//                       size: 14,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }