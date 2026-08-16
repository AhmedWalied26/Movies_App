import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/features/auth/register/widgets/customized_avatar.dart';
import 'package:movies_app/features/onboarding/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';

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
    final size = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .032),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.loginScreen,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.primaryColor,
                        size: 11,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      l10n.register,
                      style: AppStyles.regular12White.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 8,
                      ),
                    ),

                    const Spacer(),

                    const SizedBox(width: 11),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(avatarImages.length, (index) {
                    final bool isSelected = index == selectedAvatarIndex;

                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
                      child: CustomizedAvatar(
                        imagePath: avatarImages[index],
                        size: isSelected ? 68 : 43,
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

                const SizedBox(height: 5),

                Text(
                  l10n.avatar,
                  style: AppStyles.regular12White.copyWith(fontSize: 7),
                ),

                const SizedBox(height: 12),

                CustomizedTextField(
                  controller: nameController,
                  hintText: l10n.name,
                  prefixIcon: AppAssets.nameIcon,
                ),

                const SizedBox(height: 11),

                CustomizedTextField(
                  controller: emailController,
                  hintText: l10n.email,
                  prefixIcon: AppAssets.emailIcon,
                ),

                const SizedBox(height: 11),

                CustomizedTextField(
                  controller: passwordController,
                  hintText: l10n.password,
                  prefixIcon: AppAssets.passwordIcon,
                  isPassword: true,
                ),

                const SizedBox(height: 11),

                CustomizedTextField(
                  controller: confirmPasswordController,
                  hintText: l10n.confirm_Password,
                  prefixIcon: AppAssets.passwordIcon,
                  isPassword: true,
                ),

                const SizedBox(height: 11),

                CustomizedTextField(
                  controller: phoneController,
                  hintText: l10n.phone_Number,
                  prefixIcon: AppAssets.phoneIcon,
                ),

                const SizedBox(height: 12),

                CustomElevatedButton(
                  onPressedButton2: () {},
                  title: l10n.create_Account,
                  style: AppStyles.semi20Black,
                ),

                const SizedBox(height: 9),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${l10n.already_Have_Account} ?',
                      style: AppStyles.regular14White,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                      child: Text(l10n.login, style: AppStyles.bold14Primary),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.enIcon),
                    const SizedBox(width: 2),
                    SvgPicture.asset(AppAssets.arIcon),
                  ],
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
