import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> _sendPasswordResetEmail() async {
    final email = emailController.text.trim();
    if (email.isEmpty) return;

    setState(() => isLoading = true);
    try {
      await AuthService.instance.sendPasswordResetEmail(email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.password_Reset_Email_Sent),
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.code == 'user-not-found'
                  ? AppLocalizations.of(context)!.account_Not_Found
                  : AppLocalizations.of(context)!.password_Reset_Error,
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: Text(l10n.forget_Password, style: AppStyles.regular16Primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.024),
            child: Column(
              children: [
                SizedBox(height: height * 0.015),

                Image.asset(AppAssets.forgetPasswordImage),

                SizedBox(height: height * 0.024),

                CustomTextField(
                  title: l10n.email,
                  prefix: SvgPicture.asset(AppAssets.emailIcon),
                    controller: emailController,
                    type: TextInputType.emailAddress,
                ),

                SizedBox(height: height * 0.024),

                CustomElevatedButton(
                  onPressedButton2: isLoading ? () {} : _sendPasswordResetEmail,
                  title: l10n.verify_Email,
                  style: AppStyles.regular20Black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
