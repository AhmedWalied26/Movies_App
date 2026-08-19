import 'package:flutter/material.dart';
import 'package:movies_app/Providers/Language_Provider.dart';
import 'package:movies_app/features/auth/login/custom_elevated_button.dart';
import 'package:movies_app/features/auth/login/widgets/google_button.dart';
import 'package:movies_app/features/auth/login/widgets/language_switcher.dart';
import 'package:movies_app/features/auth/login/widgets/size_utils.dart';
import 'package:movies_app/features/auth/login/widgets/text_field.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

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
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.019),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Image.asset(AppAssets.mainLogo, width: 121, height: 118),
                      SizedBox(height: height * 0.069),

                      CustomizedTextField(
                        controller: emailController,
                        hintText: l10n.email,
                        prefixIcon: AppAssets.emailIcon,
                      ),

                      SizedBox(height: height * 0.022),

                      CustomizedTextField(
                        controller: passwordController,
                        hintText: l10n.password,
                        prefixIcon: AppAssets.passwordIcon,
                        isPassword: true,
                      ),
                      SizedBox(height: height * 0.017),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.0017,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,

                                AppRoutes.forgotPasswordScreen,
                              );
                            },
                            child: Text(
                              '${l10n.forget_Password} ?',
                              style: AppStyles.regular14Primary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                     
                      CustomElevatedButton(
                        onPressedButton2: () {
                      
                        },
                        title: l10n.login,
                        style: AppStyles.regular20Black,
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${l10n.dont_Have_Account} ? ',
                            style: AppStyles.regular14White,
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
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.027),

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
                              style: AppStyles.regular16Primary,
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

                      SizedBox(height: height * 0.027),

                      GoogleButton(),
                      SizedBox(height: height * 0.033),

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
