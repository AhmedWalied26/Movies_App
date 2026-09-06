import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/auth/login/widgets/google_sign_in_button.dart';
import 'package:movies_app/features/auth/login/widgets/language_switcher.dart';
import 'package:movies_app/features/auth/login/widgets/mode_switcher.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/services/firebase_service.dart';
import 'package:movies_app/utils/app_validation.dart';
import 'package:movies_app/widgets/app_overlay.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(
    text: "youssef@example.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "Youssef123@",
  );

  bool isPasswordVisible = false;
  var formKey = GlobalKey<FormState>();

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // backgroundColor: AppColors.blackColor,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.024),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.024),
                      Image.asset(AppAssets.mainLogo),
                      SizedBox(height: height * 0.069),
                      CustomTextField(
                        type: TextInputType.emailAddress,
                        title: l10n.email,
                        prefix: SvgPicture.asset(
                          isDark
                              ? AppAssets.emailIcon
                              : AppAssets.emailIconLight,
                        ),
                        controller: emailController,
                        validation: (text) {
                          return AppValidation.validateEmail(context, text);
                        },
                      ),
                      SizedBox(height: height * 0.022),
                      CustomTextField(
                        type: TextInputType.visiblePassword,
                        title: l10n.password,
                        prefix: SvgPicture.asset(
                          isDark
                              ? AppAssets.passwordIcon
                              : AppAssets.passwordIconLight,
                        ),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        controller: passwordController,
                        validation: (text) {
                          return AppValidation.validatePassword(context, text);
                        },
                        isObsecure: !isPasswordVisible,
                      ),
                      SizedBox(height: height * 0.017),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.0017),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.forgotPasswordScreen,
                              );
                            },
                            child: Text(
                              l10n.forget_Password,
                              style: AppStyles.regular14Primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.033),
                      CustomElevatedButton(
                        isLoading: isLoading,
                        onPressedButton2: () {
                          login(context);
                        },
                        title: l10n.login,
                        style: Theme.of(context).textTheme.displayMedium!,
                      ),
                      SizedBox(height: height * 0.022),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${l10n.dont_Have_Account} ? ',
                            style: Theme.of(context).textTheme.displaySmall!,
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
                                // color: AppColors.primaryColor,
                                color: Theme.of(context).colorScheme.primary,
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
                              indent: 100,
                              endIndent: 10,
                            ),
                          ),
                          Text(l10n.oR, style: AppStyles.regular16Primary),
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryColor,
                              indent: 10,
                              endIndent: 100,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.027),
                      GoogleSignInButton(),
                      SizedBox(height: height * 0.033),
                      Row(
                        spacing: 10,
                        children: [
                          ValueListenableBuilder<ThemeMode>(
                            valueListenable: ThemeController.instance,
                            builder: (context, themeMode, _) {
                              return AppModeSwitcher(
                                selectedMode: themeMode,
                                onModeChanged: (mode) {
                                  ThemeController.instance.value = mode;
                                },
                              );
                            },
                          ),
                          ValueListenableBuilder<Locale>(
                            valueListenable: LocaleController.instance,
                            builder: (context, locale, _) {
                              return LanguageSwitcher(
                                selectedLocale: locale,
                                onLanguageChanged: (newLocale) {
                                  LocaleController.instance.value = newLocale;
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

  final authService = AuthService();
  bool isLoading = false;

  void login(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    if (formKey.currentState?.validate() != true) return;

    setState(() => isLoading = true);

    final result = await authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (!mounted || !context.mounted) return;
    setState(() => isLoading = false);

    if (result.success) {
      AppOverlay.showSuccess(
        context,
        l10n.login_successful,
        onFinished: () {
          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.mainScreen,
              (route) => false,
            );
          }
        },
      );
    } else {
      AppOverlay.showError(
        context,
        getAuthErrorMessage(l10n, result.errorCode!),
      );
    }
  }
}
