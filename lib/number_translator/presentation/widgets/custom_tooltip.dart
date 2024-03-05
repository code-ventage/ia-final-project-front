
import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({super.key, this.child, this.message});

  final Widget? child;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}