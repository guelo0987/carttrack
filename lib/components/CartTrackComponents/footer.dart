import 'package:carttrack/pages/CitasScreens/Citas_screen.dart';
import 'package:carttrack/pages/CitasScreens/Crear_citas_screen.dart';
import 'package:carttrack/pages/CitasScreens/Solicitar_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/pages/MyAccountScreens/Dashboard_screen.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CrearCitasScreen()));
        break;
    }
  }

  Widget _buildIcon(String iconPath, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0500C6) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: isSelected ? 18 : 24,
            height: isSelected ? 18 : 24,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 59,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcon('images/icons/home_footer.png', 0),
          _buildIcon('images/icons/calendar_footer.png', 1),
          _buildIcon('images/icons/footer_bag.png', 2),
          _buildIcon('images/icons/mantenimiento_footer.png', 3),
          _buildIcon('images/icons/notificaciones_footer.png', 4),
        ],
      ),
    );
  }
}
