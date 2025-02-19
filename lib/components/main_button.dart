import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool transparent;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget? icon;

  const MainButton({
    required this.text,
    required this.onPressed,
    this.transparent = false,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      margin: const EdgeInsets.symmetric(vertical: 13),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: transparent ? Colors.transparent : backgroundColor,
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
          fixedSize: const Size(264, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) icon!,
              if (icon != null) const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Mundial',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? const Color(0xFF0500C6),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
