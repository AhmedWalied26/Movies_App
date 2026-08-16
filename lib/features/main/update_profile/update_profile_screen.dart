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
  bool isPickingAvatar = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.06,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(l.pick_Avatar, style: AppStyles.bold18Primary),
                ],
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPickingAvatar = !isPickingAvatar;
                    });
                  },
                  child: Image.asset(
                    selectedAvatar,
                    width: 150,
                    height: 150,
                    fit: .cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              CustomTextField(
                title: l.name,
                prefix: SvgPicture.asset(AppAssets.profileNameIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                title: l.phone_Number,
                prefix: SvgPicture.asset(AppAssets.phoneIcon),
              ),
              SizedBox(height: height * 0.01),
              TextButton(
                onPressed: () {},
                child: Text(l.reset_Password, style: AppStyles.bold16White),
              ),

              SizedBox(height: height * 0.10),
              if (isPickingAvatar) ...[
                UpdateProfileAvatar(
                  selectedAvatar: selectedAvatar,
                  onAvatarSelected: (newAvatar) {
                    setState(() {
                      selectedAvatar = newAvatar;
                      isPickingAvatar = false;
                    });
                  },
                ),
                SizedBox(height: height * 0.04),
              ],
              if (!isPickingAvatar) ...[
                SizedBox(height: height * 0.10),
                CustomElevatedButton(
                  bgColor: AppColors.redColor,
                  onPressedButton2: () {},
                  title: l.delete_Account,
                  style: AppStyles.regular20White,
                ),
                SizedBox(height: height * 0.02),
                CustomElevatedButton(
                  onPressedButton2: () {},
                  title: l.update_Data,
                  style: AppStyles.regular20Black,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
