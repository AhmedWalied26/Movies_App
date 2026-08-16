import 'package:flutter/material.dart';
import 'package:movies_app/Providers/Language_Provider.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'update_profile_avatar.dart';

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
    var languageProvider = Provider.of<LanguageProvider>(context);
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
                      child:  Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                   Text(
                   l.pick_Avatar,
                    style: AppStyles.bold18Primary
                  ),
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
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              TextField(
                style:  TextStyle(color: AppColors.whiteColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.darkGreyColor,
                  prefixIcon:  Icon(Icons.person, color: AppColors.whiteColor),
                  hintText: l.name,
                  hintStyle: TextStyle(color: AppColors.whiteColor.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              TextField(
                style:  TextStyle(color: AppColors.whiteColor),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.darkGreyColor,
                  prefixIcon:  Icon(Icons.phone, color: AppColors.whiteColor),
                  hintText: l.phone_Number,
                  hintStyle: TextStyle(color: AppColors.whiteColor.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              TextButton(
                onPressed: () {},
                child:  Text(
                  l.reset_Password,
                  style: AppStyles.bold16White,
                ),
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child:  Text(
                      l.delete_Account,
                      style: AppStyles.bold18White,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child:  Text(
                      l.update_Data,
                      style: AppStyles.bold18Black
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}