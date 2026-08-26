import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

      // 1. التحقق أن الحقل ليس فارغاً
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your email address')),
        );
        return;
      }

      // 2. البحث في جدول الـ users للتأكد من وجود الإيميل مسبقاً
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      // 3. لو الإيميل مش موجود، أظهر رسالة خطأ فوراً
      if (querySnapshot.docs.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found with this email.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // 4. لو الإيميل موجود، أرسل رسالة إعادة تعيين كلمة المرور
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent! Check your email.'),
          backgroundColor: Colors.green,
        ),
      );

      // الانتقال لشاشة تسجيل الدخول بعد الإرسال الناجح
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);

    } on FirebaseAuthException catch (e) {
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
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    } catch (e) {
      print("ERROR: $e");
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
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: Text(l10n.forget_Password, style: AppStyles.regular16Primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            child: Column(
              children: [
                Image.asset(AppAssets.forgetPasswordImage),
                CustomTextField(
                  prefix: SvgPicture.asset(AppAssets.emailIcon),
                  controller: emailController,
                  title: AppLocalizations.of(context)!.email,
                ),

                SizedBox(height: height * 0.02),

                CustomElevatedButton(
                  onPressedButton2: resetPassword,
                  title: AppLocalizations.of(context)!.verify_Email,
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
