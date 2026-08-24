import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/api/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  Future<void> _loginWithGoogle() async {
    setState(() => isLoading = true);
    try {
      final result = await AuthService.instance.signInWithGoogle();
      if (result == null) return;
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.mainScreen,
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.message ?? AppLocalizations.of(context)!.google_Login_Error,
            ),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.google_Login_Error}\n$error',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> _login() async {
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      return;
    }
    setState(() => isLoading = true);
    try {
      await AuthService.instance.signInWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.mainScreen,
        (route) => false,
      );
    } on FirebaseAuthException catch (error) {
      if (mounted) {
        final message = error.code == 'user-not-found'
            ? AppLocalizations.of(context)!.account_Not_Found
            : error.message ?? 'Unable to log in';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

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
                padding: EdgeInsets.symmetric(horizontal: width * 0.024),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.024),
                      Image.asset(AppAssets.mainLogo),
                      SizedBox(height: height * 0.069),

                      CustomTextField(
                        title: l10n.email,
                        prefix: SvgPicture.asset(AppAssets.emailIcon),
                        controller: emailController,
                      ),

                      SizedBox(height: height * 0.022),

                      CustomTextField(
                        title: l10n.password,
                        prefix: SvgPicture.asset(AppAssets.passwordIcon),
                        controller: passwordController,
                        isObsecure: !isPasswordVisible,
                        suffix: IconButton(
                          onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible,
                          ),
                          icon: SvgPicture.asset(AppAssets.visibleOffIcon),
                        ),
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
                              '${l10n.forget_Password} ?',
                              style: AppStyles.regular14Primary,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.033),

                      CustomElevatedButton(
                        onPressedButton2: isLoading ? () {} : _login,
                        title: l10n.login,
                        style: AppStyles.regular20Black,
                      ),
                      SizedBox(height: height * 0.022),

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

                      CustomElevatedButton(
                        onPressedButton2: isLoading ? () {} : _loginWithGoogle,
                        title: l10n.login_With_Google,
                        style: AppStyles.regular20Black,
                        child: SvgPicture.asset(
                          AppAssets.googleIcon,
                          height: height * 0.026,
                        ),
                      ),
                      SizedBox(height: height * 0.033),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: .circular(30),
                          border: .all(color: AppColors.primaryColor, width: 3),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          spacing: width * 0.03,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.enIcon),
                            SvgPicture.asset(AppAssets.arIcon),
                          ],
                        ),
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
