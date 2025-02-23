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
