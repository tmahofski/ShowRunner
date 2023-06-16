import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
    required this.onChanged,
    this.onTap,
    this.textEditingController,
    this.initialValue,
    this.prefixIcon,
    super.key,
  });

  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final Function(String) onChanged;
  final VoidCallback? onTap;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.abc),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textAlign: TextAlign.center,
        obscureText: obscureText,
        onChanged: onChanged,
        onTap: onTap,
        controller: textEditingController,
      ),
    );
  }
}
