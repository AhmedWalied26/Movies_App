// import 'package:flutter/material.dart';
// import 'package:movies_app/utils/app_colors.dart';
// import 'package:movies_app/utils/size_utils.dart';

// class CustomTextField extends StatelessWidget {
//   final String title;
//   final String? hintText;
//   final Widget? prefix;
//   final Widget? suffix;
//   final TextEditingController? controller;
//   final FormFieldValidator<String>? validation;
//   final bool isObsecure;
//   final int? maxLines;
//   final TextInputType? type;
//   final ValueChanged<String>? onChanged;
//   const CustomTextField({
//     super.key,
//     required this.title,
//     this.hintText,
//     this.prefix,
//     this.suffix,
//     this.controller,
//     this.validation,
//     this.isObsecure = false,
//     this.maxLines = 1,
//     this.type,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var width = context.width;
//     return TextFormField(
//       onChanged: onChanged,
//       onTapOutside: (event) {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       // cursorColor: AppColors.primaryColor,

//       cursorColor: Theme.of(context).colorScheme.primary,
//       keyboardType: type,
//       maxLines: maxLines,
//       obscureText: isObsecure,
//       validator: validation,
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText ?? title,
//         prefixIcon: Padding(
//           padding: EdgeInsetsDirectional.only(
//             start: width * 0.025,
//             end: width * 0.02,
//           ),
//           child: prefix,
//         ),
//         prefixIconConstraints: BoxConstraints(minWidth: 0),
//         suffixIcon: suffix,
//         errorStyle: Theme.of(context).textTheme.headlineSmall,
//         errorBorder: OutlineInputBorder(

//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide:  BorderSide(color: Theme.of(context).colorScheme.error, width: 1.5),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:movies_app/utils/size_utils.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final bool isObsecure;
  final int? maxLines;
  final TextInputType? type;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.title,
    this.hintText,
    this.prefix,
    this.suffix,
    this.controller,
    this.validation,
    this.isObsecure = false,
    this.maxLines = 1,
    this.type,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    return TextFormField(
      controller: controller,
      validator: validation,
      onChanged: onChanged,

      keyboardType: type,
      maxLines: maxLines,
      obscureText: isObsecure,

      cursorColor: Theme.of(context).colorScheme.primary,

      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        hintText: hintText ?? title,

        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(
            start: width * 0.025,
            end: width * 0.02,
          ),
          child: prefix,
        ),

        prefixIconConstraints: const BoxConstraints(minWidth: 0),

        suffixIcon: suffix,

        errorStyle: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
