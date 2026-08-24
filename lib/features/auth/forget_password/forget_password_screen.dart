import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword() async {
    try {
      String email = emailController.text.trim().toLowerCase();
      print("Email entered: $email");

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Please enter your email address')),
        );
        return;
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text('Password reset link sent! Check your email.'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);

    } on FirebaseAuthException catch (e) {
      print("Firebase error: ${e.code}");
      String message = 'An error occurred';
      if (e.code == 'user-not-found') {
        message = 'No user found with this email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      } else {
        message = e.message ?? 'An error occurred';
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print("General error: $e");
    }
  }

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
          icon:  Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: Text(l10n.forget_Password, style: AppStyles.regular16Primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  width: 430,
                  height: 430,
                  child: Image.asset(
                    AppAssets.forgetPasswordImage,
                  ),
                ),

                SizedBox(height: height * 0.00),

                TextField(
                  controller: emailController,
                  style:  TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: l10n.email,
                    labelStyle:  TextStyle(color: Colors.grey),
                    prefixIcon: Padding(
                      padding:  EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AppAssets.emailIcon),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: resetPassword,
                  child: Text(l10n.verify_Email, style: AppStyles.regular20Black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}