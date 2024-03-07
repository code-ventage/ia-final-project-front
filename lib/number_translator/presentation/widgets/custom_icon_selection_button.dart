import 'package:flutter/material.dart';

class CustomIconSelectionButton extends StatelessWidget {
  const CustomIconSelectionButton({
    Key? key,
    this.onSelected,
    this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final IconData? icon;
  final bool isSelected;
  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: 4,
            width: isSelected ? 0 : 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorScheme.secondary,
            ),
          ),
        ),
        IconButton(
          key: const ValueKey<int>(1),
          onPressed: onSelected,
          icon: Icon(
            icon,
            size: 30,
            color: isSelected ? colorScheme.onInverseSurface : colorScheme.primary,
          ),
        ),
      ],
    );
  }
}