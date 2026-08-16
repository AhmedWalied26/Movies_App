// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:movies/utils/app_assets.dart';
// import 'package:movies/utils/app_colors.dart';
// import 'package:movies/utils/app_styles.dart';
// import 'package:movies/utils/size_utils.dart';

// class CustomTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String prefixIcon;
//   final bool isPassword;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//     this.isPassword = false,
//   });

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   bool isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.height * 0.055,
//       child: TextField(
//         controller: widget.controller,
//         obscureText: widget.isPassword && !isPasswordVisible,

//         style: AppStyles.regular12White.copyWith(
//           fontSize: context.width * 0.032,
//         ),

//         cursorColor: AppColors.primaryColor,

//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.darkGreyColor,

//           hintText: widget.hintText,
//           hintStyle: AppStyles.regular12White.copyWith(
//             fontSize: context.width * 0.032,
//           ),

//           prefixIcon: Padding(
//             padding: EdgeInsets.all(context.width * 0.018),
//             child: SvgPicture.asset(
//               widget.prefixIcon,
//               width: context.width * 0.04,
//               height: context.width * 0.04,
//             ),
//           ),

//           suffixIcon: widget.isPassword
//               ? GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isPasswordVisible = !isPasswordVisible;
//                     });
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(context.width * 0.018),
//                     child: isPasswordVisible
//                         ? Icon(
//                             Icons.visibility_outlined,
//                             size: context.width * 0.04,
//                             color: AppColors.whiteColor,
//                           )
//                         : SvgPicture.asset(
//                             AppAssets.visibleOffIcon,
//                             width: context.width * 0.04,
//                             height: context.width * 0.04,
//                           ),
//                   ),
//                 )
//               : null,

//           contentPadding: EdgeInsets.symmetric(
//             horizontal: context.width * 0.015,
//             vertical: 0,
//           ),

//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(
//               context.width * 0.015,
//             ),
//             borderSide: BorderSide.none,
//           ),

//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(
//               context.width * 0.015,
//             ),
//             borderSide: BorderSide.none,
//           ),

//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(
//               context.width * 0.015,
//             ),
//             borderSide: BorderSide(
//               color: AppColors.primaryColor,
//               width: context.width * 0.002,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }