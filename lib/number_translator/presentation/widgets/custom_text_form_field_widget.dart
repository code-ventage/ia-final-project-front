import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.readOnly,
    this.onChanged,
    required this.controller,
    this.borderColor,
    this.suffix,
    this.autofocus
  });

  final bool readOnly;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Color? borderColor;
  final Widget? suffix;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      readOnly: readOnly,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      expands: true,
      controller: controller,
      onChanged: onChanged,
      cursorHeight: 22,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: suffix,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor??Theme.of(context).colorScheme.secondary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor??Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor??Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}