import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath; // Nuevo parámetro para la ruta del icono

  const BackArrowButton({
    Key? key,
    required this.onPressed,
    this.iconPath = 'images/icons/left_arrow_blue.png', // Valor por defecto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Image.asset(
            iconPath, // Usamos el parámetro aquí
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}