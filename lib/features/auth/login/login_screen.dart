import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/auth/login/widgets/flags.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/features/auth/login/widgets/word_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),

                      Image.asset(AppAssets.mainLogo, width: 100, height: 100),

                      const SizedBox(height: 27),

                      CustomizedTextField(
                        controller: emailController,
                        hintText: l10n.email,
                        prefixIcon: AppAssets.emailIcon,
                      ),

                      const SizedBox(height: 10),

                      CustomizedTextField(
                        controller: passwordController,
                        hintText: l10n.password,
                        prefixIcon: AppAssets.passwordIcon,
                        isPassword: true,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, right: 2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,

                                AppRoutes.forgotPasswordScreen,
                              );
                            },
                            child: Text(
                              '${l10n.forget_Password} ?',
                              style: AppStyles.regular12White.copyWith(
                                fontSize: 6,
                                color: AppColors.primaryColor,
                                //
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      WordButton(
                        text: l10n.login,
                        onPressed: () {
                          // Login
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${l10n.dont_Have_Account} ? ',
                            style: AppStyles.regular12White.copyWith(
                              fontSize: 6,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.registerScreen,
                              );
                            },
                            child: Text(
                              l10n.create_One,
                              style: AppStyles.bold14Primary.copyWith(
                                fontSize: 6,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 13),

                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryColor,
                              thickness: 0.5,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              l10n.oR,
                              style: AppStyles.bold14Primary.copyWith(
                                fontSize: 7,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),

                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryColor,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 13),

                      WordButton(
                        onPressed: () {
                          // Google Login
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.googleIcon,
                              width: 15,
                              height: 15,
                            ),

                            const SizedBox(width: 5),

                            Text(
                              l10n.login_With_Google,
                              style: AppStyles.regular14Black.copyWith(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flag(countryCode: 'US'),
                          const SizedBox(width: 2),
                          Flag(countryCode: 'EG'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
