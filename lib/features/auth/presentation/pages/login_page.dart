import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/images_paths.dart';
import 'package:clean_architecture/core/util/size_config.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValue = '';
  bool _passwordVisible = false;

  bool isLoading = false;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.BACKGROUND_LIGHT,
        leading: IconButton(
          icon: SvgPicture.asset(ImagesPaths.BACK_BLUE_IMAGE),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        color: ColorResources.BACKGROUND_LIGHT,
        padding: EdgeInsets.all(getProportionateScreenHeight(28)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                SvgPicture.asset(ImagesPaths.LOGO_BLUE_IMAGE),
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                Text(
                  ('lets_get_started').tr(),
                  style: const TextStyle(
                    letterSpacing: -3,
                    color: ColorResources.PRIMARY_COLOR,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(14),
                ),
                Text(
                  'email_address_header'.tr(),
                  style: const TextStyle(
                      color: ColorResources.TEXT_SECONDARY_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(36),
                ),
                AuthTextField(
                  keyboardType: TextInputType.emailAddress,
                  label: 'email_label'.tr(),
                  hint: 'email_hint'.tr(),
                  controller: emailController,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email_error'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                AuthTextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordVisible,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(_passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  label: 'password_label'.tr(),
                  hint: 'password_hint'.tr(),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password_error'.tr();
                    }
                    return null;
                  },
                  onFieldSubmitted: isLoading || !isValid
                      ? null
                      : (value) {
                          _onLoginClicked();
                        },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                TextButton(
                  onPressed: _onForgetPasswordClick,
                  child: Text(
                    'forget_password'.tr(),
                    style: const TextStyle(
                      color: ColorResources.PRIMARY_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: isLoading || !isValid ? null : _onLoginClicked,
                    child: Text(
                      'login'.tr(),
                      style: const TextStyle(
                          color: ColorResources.TEXT_PRIMARY_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Center(
                  child: Text(
                    'continue_with'.tr(),
                    style: const TextStyle(
                      color: ColorResources.TEXT_SECONDARY_DISABLE_COLOR,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: FloatingActionButton(
                        onPressed: _onFacebookClick,
                        elevation: 0,
                        shape: const CircleBorder(),
                        backgroundColor: ColorResources.FACEBOOK_COLOR,
                        child: SvgPicture.asset(ImagesPaths.FACEBOOK_WHITE),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: FloatingActionButton(
                        onPressed: _onFacebookClick,
                        elevation: 0,
                        shape: const CircleBorder(),
                        backgroundColor: ColorResources.X_COLOR,
                        child: SvgPicture.asset(ImagesPaths.X_WHITE),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: FloatingActionButton(
                        onPressed: _onFacebookClick,
                        elevation: 0,
                        shape: const CircleBorder(),
                        backgroundColor: ColorResources.GOOGLE_COLOR,
                        child: SvgPicture.asset(ImagesPaths.GOOGLE_WHITE),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: FloatingActionButton(
                        onPressed: _onFacebookClick,
                        elevation: 0,
                        shape: const CircleBorder(),
                        backgroundColor: ColorResources.APPLE_COLOR,
                        child: SvgPicture.asset(ImagesPaths.APPLE_WHITE),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'not_registered'.tr(),
                      style: const TextStyle(
                        color: ColorResources.TEXT_SECONDARY_DARK_COLOR,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: _onCreateAnAccountClick,
                      child: Text(
                        'create_account'.tr(),
                        style: const TextStyle(
                          color: ColorResources.PRIMARY_COLOR,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginClicked() {}

  void _onForgetPasswordClick() {}

  void _onCreateAnAccountClick() {}

  void _onFacebookClick() {}
}
