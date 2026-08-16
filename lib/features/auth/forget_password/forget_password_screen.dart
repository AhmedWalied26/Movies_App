import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .032),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.primaryColor,
                        size: 11,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      l10n.forget_Password,
                      style: AppStyles.regular12White.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 8,
                      ),
                    ),

                    const Spacer(),

                    const SizedBox(width: 11),
                  ],
                ),

                const SizedBox(height: 15),

                Image.asset(AppAssets.forgetPasswordImage),

                const SizedBox(height: 11),

                CustomizedTextField(
                  controller: emailController,
                  hintText: l10n.email,
                  prefixIcon: AppAssets.emailIcon,
                ),

                const SizedBox(height: 30),

                CustomElevatedButton(
                  onPressedButton2: () {},
                  title: l10n.verify_Email,
                  style: AppStyles.semi20Black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
