import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return SizedBox(
      height: 26,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && !isPasswordVisible,
        style: AppStyles.regular12White.copyWith(fontSize: 7),
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.darkGreyColor,
          hintText: widget.hintText,
          hintStyle: AppStyles.regular12White.copyWith(fontSize: 7),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(6),
            child: SvgPicture.asset(widget.prefixIcon, width: 13, height: 13),
          ),

          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: isPasswordVisible
                        ? const Icon(
                            Icons.visibility_outlined,
                            size: 13,
                            color: AppColors.whiteColor,
                          )
                        : SvgPicture.asset(
                            AppAssets.visibleOffIcon,
                            width: 13,
                            height: 13,
                          ),
                  ),
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
