import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/login/custom_elevated_button.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/features/auth/login/widgets/size_utils.dart';
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
    var height = context.height;
    var width = context.width;
    final l10n = AppLocalizations.of(context)!;

    return
  
    Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 16,
          ),
        ),
        title: Text(l10n.forget_Password, style: AppStyles.regular16Primary),
      ),
     
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.016),
            child: Column(
              children: [
                const SizedBox(height: 15),

                Image.asset(AppAssets.forgetPasswordImage),

                SizedBox(height: height * 0.024),

                CustomizedTextField(
                  controller: emailController,
                  hintText: l10n.email,
                  prefixIcon: AppAssets.emailIcon,
                ),

                SizedBox(height: height * 0.024),

                CustomElevatedButton(
                  onPressedButton2: () {},
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
