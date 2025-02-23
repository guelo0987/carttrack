import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const BaseCard({
    Key? key,
    required this.child,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final responsiveHeight = screenHeight * 0.12; // Reducido de 0.15 a 0.12

    return Center(
      child: Container(
        width: width ?? screenWidth * 0.9,
        constraints: BoxConstraints(minHeight: responsiveHeight),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.5, -0.5),
            end: Alignment(1, 1),
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF4FAFF),
            ],
            stops: [0.4604, 0.8124],
            transform: GradientRotation(238.44 * 3.14159 / 180),
          ),
          borderRadius:
              BorderRadius.circular(screenWidth * 0.04), // Reducido de 0.05
          boxShadow: [
            BoxShadow(
              color: Color(0xFFC8DCEA),
              offset: Offset(0, screenHeight * 0.02), // Reducido de 0.03
              blurRadius: screenWidth * 0.06, // Reducido de 0.08
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: padding ??
                  EdgeInsets.all(screenWidth * 0.04), // Reducido de 0.06
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                  SizedBox(height: screenHeight * 0.01), // Reducido de 0.02
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
