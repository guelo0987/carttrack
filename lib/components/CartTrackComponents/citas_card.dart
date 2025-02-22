import 'package:flutter/material.dart';

class ReparacionCard extends StatelessWidget {
  final String textCard;
  final bool isSelected;
  final VoidCallback onTap;

  const ReparacionCard({
    Key? key,
    required this.textCard,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 159,
        height: 138,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment(-0.5, -0.5),
                  end: Alignment(0.8, 0.8),
                  colors: [
                    Color(0xFF0500C6),
                    Color(0xFF0500C6),
                  ],
                )
              : const LinearGradient(
                  begin: Alignment(-0.5, -0.5),
                  end: Alignment(0.8, 0.8),
                  colors: [
                    Colors.white,
                    Color(0xFFF4FAFF),
                  ],
                  stops: [0.4604, 0.8124],
                ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFC8DCEA),
              offset: Offset(0, 28),
              blurRadius: 35,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textCard,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF0500C6),
                fontSize: 16,
                fontFamily: 'Mundial',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
