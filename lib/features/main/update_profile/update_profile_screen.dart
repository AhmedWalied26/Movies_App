import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/features/main/update_profile/widgets/update_profile_avatar.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String selectedAvatar = AppAssets.profileImage8;

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.darkBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 40,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l.pick_Avatar,
          style: AppStyles.bold16Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.00),
              Center(
                child: GestureDetector(
                  onTap: _showAvatarBottomSheet,
                  child: Image.asset(
                    selectedAvatar,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              SizedBox(
                height: 50,
                child: CustomTextField(
                  title: l.name,
                  prefix: SvgPicture.asset(AppAssets.profileNameIcon),
                ),
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                height: 50,
                child: CustomTextField(
                  title: l.phone_Number,
                  prefix: SvgPicture.asset(AppAssets.phoneIcon),
                ),
              ),

              SizedBox(height: height * 0.01),
              TextButton(
                onPressed: () {},
                child: Text(l.reset_Password, style: AppStyles.bold16White),
              ),

              SizedBox(height: height * 0.25),

              SizedBox(
                height: 51,
                child: CustomElevatedButton(
                  bgColor: AppColors.redColor,
                  onPressedButton2: () {},
                  title: l.delete_Account,
                  style: AppStyles.regular20White,
                ),
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                height: 51,
                child: CustomElevatedButton(
                  onPressedButton2: () {},
                  title: l.update_Data,
                  style: AppStyles.regular20Black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}