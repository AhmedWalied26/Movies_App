import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/login/custom_elevated_button.dart';
import 'package:movies_app/features/auth/login/widgets/flags.dart';
import 'package:movies_app/features/auth/login/widgets/language_switcher.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/features/auth/login/widgets/word_button.dart';
import 'package:movies_app/features/auth/register/widgets/customized_avatar.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/features/auth/login/widgets/size_utils.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/Providers/Language_Provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final List<String> avatarImages = [
    AppAssets.profileImage2,
    AppAssets.profileImage8,
    AppAssets.profileImage3,
  ];

  int selectedAvatarIndex = 1;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
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
        title: Text(l10n.register, style: AppStyles.regular16Primary),
      ),

      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.016),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(avatarImages.length, (index) {
                      final bool isSelected = index == selectedAvatarIndex;

                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 24),
                        child: CustomizedAvatar(
                          imagePath: avatarImages[index],
                          size: isSelected ? 140 : 80,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedAvatarIndex = index;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: height * 0.010),

                Text(l10n.avatar, style: AppStyles.regular16White),

                SizedBox(height: height * 0.010),

                CustomizedTextField(
                  controller: nameController,
                  hintText: l10n.name,
                  prefixIcon: AppAssets.nameIcon,
                ),

                SizedBox(height: height * 0.024),

                CustomizedTextField(
                  controller: emailController,
                  hintText: l10n.email,
                  prefixIcon: AppAssets.emailIcon,
                ),

                SizedBox(height: height * 0.024),

                CustomizedTextField(
                  controller: passwordController,
                  hintText: l10n.password,
                  prefixIcon: AppAssets.passwordIcon,
                  isPassword: true,
                ),

                SizedBox(height: height * 0.024),

                CustomizedTextField(
                  controller: confirmPasswordController,
                  hintText: l10n.confirm_Password,
                  prefixIcon: AppAssets.passwordIcon,
                  isPassword: true,
                ),

                SizedBox(height: height * 0.024),

                CustomizedTextField(
                  controller: phoneController,
                  hintText: l10n.phone_Number,
                  prefixIcon: AppAssets.phoneIcon,
                ),

                SizedBox(height: height * 0.024),

                CustomElevatedButton(
                  onPressedButton2: () {},
                  title: l10n.create_Account,
                  style: AppStyles.regular20Black,
                ),
                const SizedBox(height: 9),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${l10n.already_Have_Account} ? ',
                      style: AppStyles.regular14White,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        );
                      },
                      child: Text(
                        l10n.login,
                        style: AppStyles.bold14Primary.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 9),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return LanguageSwitcher(
          selectedLocale: Locale(languageProvider.appLanguage),
          onLanguageChanged: (locale) {
            languageProvider.ChangeLanguage(
              locale.languageCode,
            );
          },
        );
      },
    ),
  ],
),

                SizedBox(height: height * 0.019),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
