import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:clean_architecture/core/util/size_config.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final bool obscureText;

  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ColorResources.TEXT_SECONDARY_DARK_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextFormField(
            textInputAction: textInputAction,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hint,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorResources.TEXT_PRIMARY_COLOR),
                gapPadding: 10,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintStyle: const TextStyle(
                color: ColorResources.HINT_TEXT_COLOR,
                fontSize: 14,
              ),
            ),
            keyboardType: keyboardType,
            controller: controller,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
