import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/features/main/update_profile/widgets/update_profile_avatar.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/widgets/custom_text_field.dart';
import 'package:movies_app/utils/app_routes.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String selectedAvatar = AppAssets.profileImage8;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = true;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) setState(() => isLoading = false);
      return;
    }
    final snapshot = await AuthService.instance.getProfile();
    final data = snapshot?.data() ?? {};
    nameController.text = (data['name'] as String?) ?? user.displayName ?? '';
    phoneController.text = (data['phone'] as String?) ?? '';
    selectedAvatar = (data['avatar'] as String?) ?? AppAssets.profileImage8;
    if (mounted) setState(() => isLoading = false);
  }

  Future<void> _updateProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    setState(() => isSaving = true);
    try {
      await user.updateDisplayName(nameController.text.trim());
      await user.updateDisplayName(nameController.text.trim());
      await AuthService.instance.saveProfile(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        avatar: selectedAvatar,
        email: user.email,
      );
      if (mounted) Navigator.pop(context, true);
    } on FirebaseException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Unable to update profile')),
        );
      }
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _showAvatarBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkBlackColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: UpdateProfileAvatar(
              selectedAvatar: selectedAvatar,
              onAvatarSelected: (newAvatar) {
                setState(() {
                  selectedAvatar = newAvatar;
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await AuthService.instance.deleteAccount();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.loginScreen,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.darkBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(loc.pick_Avatar, style: AppStyles.bold16Primary),
      ),
        body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _showAvatarBottomSheet,
                child: Image.asset(
                  selectedAvatar,
                  height: height * 0.13,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            CustomTextField(
              title: loc.name,
              prefix: SvgPicture.asset(AppAssets.profileNameIcon),
              controller: nameController,
            ),

            SizedBox(height: height * 0.02),

            CustomTextField(
              title: loc.phone_Number,
              prefix: SvgPicture.asset(AppAssets.phoneIcon),
              controller: phoneController,
            ),

            SizedBox(height: height * 0.01),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.resetPasswordScreen,
              ),
              child: Text(loc.reset_Password, style: AppStyles.bold16White),
            ),
            Spacer(),
            CustomElevatedButton(
              bgColor: AppColors.redColor,
              onPressedButton2: _deleteAccount,
              title: loc.delete_Account,
              style: AppStyles.regular20White,
            ),

            SizedBox(height: height * 0.019),
            CustomElevatedButton(
              onPressedButton2: isSaving ? () {} : _updateProfile,
              title: loc.update_Data,
              style: AppStyles.regular20Black,
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
