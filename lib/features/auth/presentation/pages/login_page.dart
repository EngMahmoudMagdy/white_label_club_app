import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/images_paths.dart';
import 'package:clean_architecture/core/util/size_config.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
        padding: EdgeInsets.all(getProportionateScreenHeight(16)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                SvgPicture.asset(ImagesPaths.LOGO_BLUE_IMAGE),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Text(
                  ('lets_get_started').tr(),
                  style: const TextStyle(
                    color: ColorResources.PRIMARY_COLOR,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  'email_address_header'.tr(),
                  style: const TextStyle(
                    color: ColorResources.TEXT_SECONDARY_COLOR,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                AuthTextField(
                  label: 'email_label'.tr(),
                  hint: 'email_hint'.tr(),
                  fieldController: emailController,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  fieldValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email_error'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    hintText: 'password_hint'.tr(),
                  ),
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
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: ColorResources.PRIMARY_COLOR,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).primaryColor, // Set primary color
                    ),
                    onPressed: isLoading || !isValid ? null : _onLoginClicked,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: ColorResources.TEXT_PRIMARY_COLOR,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Not registered yet?',
                      style: TextStyle(
                        color: ColorResources.TEXT_SECONDARY_DARK_COLOR,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: _onCreateAnAccountClick,
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
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
}
