import 'package:carttrack/pages/CitasScreens/Citas_screen.dart';
import 'package:carttrack/pages/CitasScreens/Crear_citas_screen.dart';
import 'package:carttrack/pages/CitasScreens/Solicitar_detail_screen.dart';
import 'package:carttrack/pages/NotificacionesScreens/historial_screen.dart';
import 'package:carttrack/pages/NotificacionesScreens/notificaciones_screens.dart';
import 'package:carttrack/pages/NotificacionesScreens/notification2_detail2.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/pages/MyAccountScreens/Dashboard_screen.dart';

class Footer extends StatefulWidget {
  final int? initialIndex; // Nuevo parámetro para el índice inicial

  const Footer({
    super.key,
    this.initialIndex,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.initialIndex ?? 0; // Inicializar con el índice proporcionado
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      // Solo navegar si es un ítem diferente
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CrearCitasScreen()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HistorialScreen()),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NotificacionesScreen()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final footerHeight = screenHeight * 0.07; // Reducido de 0.08

    return Container(
      width: screenWidth,
      height: footerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Reducido de 30
          topRight: Radius.circular(20),
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

  Widget _buildIcon(String iconPath, int index) {
    bool isSelected = _selectedIndex == index;
    final iconSize =
        MediaQuery.of(context).size.width * 0.05; // Reducido de 0.06

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: iconSize * 1.4, // Reducido de 1.6
        height: iconSize * 1.4,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0500C6) : Colors.transparent,
          borderRadius:
              BorderRadius.circular(iconSize * 0.3), // Reducido de 0.4
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: isSelected ? iconSize * 0.7 : iconSize * 0.9, // Ajustado
            height: isSelected ? iconSize * 0.7 : iconSize * 0.9,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
