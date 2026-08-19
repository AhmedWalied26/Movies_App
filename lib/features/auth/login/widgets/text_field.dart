import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/auth/login/widgets/size_utils.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';

class CustomizedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefixIcon;
  final bool isPassword;

  const CustomizedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
  });

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && !isPasswordVisible,
      style: AppStyles.regular16White,
      cursorColor: AppColors.primaryColor,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGreyColor,

        hintText: widget.hintText,
        hintStyle: AppStyles.regular16White,

        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(widget.prefixIcon, width: 24, height: 24),
        ),

        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: height * 0.012,
                    vertical: width * 0.015,
                  ),
                  child: isPasswordVisible
                      ? const Icon(
                          Icons.visibility_outlined,
                          size: 24,
                          color: AppColors.whiteColor,
                        )
                      : SvgPicture.asset(
                          AppAssets.visibleOffIcon,
                          height: height * 0.012,
                          width: width * 0.015,
                        ),
                ),
              )
            : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 0.7,
          ),
        ),
      ),
    );
  }
}
