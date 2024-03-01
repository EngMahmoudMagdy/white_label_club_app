import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back_arrow_blue.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Image.asset('assets/images/logo_blue.svg'),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Let’s get started',
                style: TextStyle(
                  color: ColorResources.PRIMARY_COLOR,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter your email address to continue.',
                style: TextStyle(
                  color: ColorResources.TEXT_SECONDARY_COLOR,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                label: 'Email Address',
                hint: 'Enter your email address',
                fieldController: emailController,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                fieldValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an Email';
                  }
                  return null;
                },
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
                  hintText: 'Enter your password',
                ),
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                onFieldSubmitted: isLoading
                    ? null
                    : (value) {
                        _onLoginClicked();
                      },
              ),
              const SizedBox(
                height: 12,
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
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _onLoginClicked,
                child: TextButton(
                  onPressed: _onForgetPasswordClick,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: ColorResources.TEXT_PRIMARY_COLOR,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
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
    );
  }

  void _onLoginClicked() {}

  void _onForgetPasswordClick() {}

  void _onCreateAnAccountClick() {}
}
