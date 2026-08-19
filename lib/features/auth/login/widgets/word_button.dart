// import 'package:flutter/material.dart';
// import 'package:movies_app/utils/app_colors.dart';
// import 'package:movies_app/utils/app_styles.dart';



// class WordButton extends StatelessWidget {
//   final String? text;
//   final Widget? child;
//   final VoidCallback onPressed;

//   const WordButton({
//     super.key,
//     this.text,
//     this.child,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 26,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryColor,
//           foregroundColor: AppColors.blackColor,
//           elevation: 0,
//           padding: EdgeInsets.zero,
//           minimumSize: Size.zero,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: child ??
//             Text(
//               text ?? '',
//               style: AppStyles.regular12Black.copyWith(
//                 fontSize: 8,
//               ),
//             ),
//       ),
//     );
//   }
// }