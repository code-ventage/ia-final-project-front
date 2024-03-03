import 'package:flutter/material.dart';

import '../bloc/translation/number_translator_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.cubit,
    required this.readOnly,
    this.onChanged,
    required this.controller,
    this.borderColor,
  });

  final NumberTranslatorCubit cubit;
  final bool readOnly;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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