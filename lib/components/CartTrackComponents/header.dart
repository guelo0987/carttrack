import 'package:flutter/material.dart';
import '../go_back.dart';

class Header extends StatelessWidget {
  final double height;
  final double opacity;
  final bool showBackArrow;
  final VoidCallback? onBackPressed;
  final String? backArrowColor;
  final String? title;
  final String? icon;
  final EdgeInsetsGeometry? titlePadding;
  final double? widthA;

  const Header(
      {super.key,
      this.height = 277, // Default height
      this.opacity = 0.0, // Default opacity overlay (0 means no dark overlay)
      this.showBackArrow = false,
      this.onBackPressed,
      this.backArrowColor = 'images/icons/left_arrow_white.png',
      this.title,
      this.icon,
      this.titlePadding,
      this.widthA = 100.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(53, 88, 141, 0.65),
            offset: const Offset(0, 6),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            // Overlay for darkness
            if (opacity > 0)
              Container(
                color: Colors.black.withOpacity(opacity),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 39, right: 44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'images/logo_dashboard.png',
                        width: 134,
                        height: 20,
                      ),
                      Image.asset(
                        'images/icons/vector_dashboard.png',
                        width: 36,
                        height: 14,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      titlePadding ?? const EdgeInsets.only(top: 40, left: 39),
                  child: Row(
                    children: [
                      if (showBackArrow && onBackPressed != null) ...[
                        BackArrowButton(
                          onPressed: onBackPressed!,
                          iconPath: backArrowColor!,
                        ),
                        SizedBox(width: widthA),
                      ] else
                        SizedBox(width: widthA),
                      if (icon != null)
                        Image.asset(
                          icon!,
                          width: 24,
                          height: 24,
                        ),
                      const SizedBox(width: 8),
                      if (title != null)
                        Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Mundial',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
