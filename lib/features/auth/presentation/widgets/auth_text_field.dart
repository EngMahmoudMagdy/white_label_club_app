import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController fieldController;
  final void Function(String?)? onFieldSubmitted;
  final String? Function(String?)? fieldValidator;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.fieldController,
    this.onFieldSubmitted,
    this.fieldValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ColorResources.TEXT_SECONDARY_COLOR,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
            controller: fieldController,
            onFieldSubmitted: onFieldSubmitted,
            validator: fieldValidator,
          ),
        ),
      ],
    );
  }
}
