import 'package:carttrack/pages/CitasScreens/Citas_screen.dart';
import 'package:carttrack/pages/MyAccountScreens/Account_screen.dart';
import 'package:carttrack/pages/NotificacionesScreens/historial_screen.dart';
import 'package:flutter/material.dart';
import '../../components/CartTrackComponents/header.dart';
import '../../components/CartTrackComponents/footer.dart';
import '../../components/CartTrackComponents/cards.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF5FC),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  const Header(height: 277),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/icons/UserDashboard.png',
                          width: 84,
                          height: 84,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bienvenido,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Mundial',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'Rafael',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontFamily: 'Mundial',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30), // Espacio después del header
              Cards(
                title: "Mi cuenta",
                description: "Datos personales y de vehículo.",
                iconPath: "images/icons/Personal.png",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountScreen()));
                },
              ),
              const SizedBox(height: 16), // Espacio entre cards
              Cards(
                title: "Citas",
                description: "Agenda, revisa o cancela tus citas.",
                iconPath: "images/icons/citas_card.png",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CitasScreen()));
                },
              ),
              const SizedBox(height: 16), // Espacio entre cards
              Cards(
                title: "Historial",
                description: "Documentación de todos los sevicios.",
                iconPath: "images/icons/historial.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HistorialScreen( )));
                },
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
              child: Footer(initialIndex: 0)
          ),
        ],
      ),
    );
  }
}
