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
    return Center(
      child: Container(
        width: width ?? MediaQuery.of(context).size.width - 32,
        constraints: const BoxConstraints(minHeight: 100),
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFC8DCEA),
              offset: Offset(0, 28),
              blurRadius: 35,
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                  const SizedBox(height: 16),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
