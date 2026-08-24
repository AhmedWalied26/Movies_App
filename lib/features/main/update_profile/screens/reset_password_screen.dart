import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/auth_service.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isSaving = false;
  

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (AuthService.instance.currentUser?.email == null ||
        newPasswordController.text.isEmpty ||
        newPasswordController.text != confirmPasswordController.text) {
      return;
    }
    setState(() => isSaving = true);
    try {
      await AuthService.instance.updatePassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Unable to reset password')),
        );
      }
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.darkBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(l10n.reset_Password, style: AppStyles.bold16Primary),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              title: l10n.old_Password,
              controller: currentPasswordController,
              isObsecure: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: l10n.new_Password,
              controller: newPasswordController,
              isObsecure: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: l10n.confirm_Password,
              controller: confirmPasswordController,
              isObsecure: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressedButton2: isSaving ? () {} : _resetPassword,
                title: l10n.update_Data,
                style: AppStyles.regular20Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
