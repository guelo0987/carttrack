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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFEBF5FC),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const Header(height: 277),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 18,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/icons/UserDashboard.png',
                                    width: 64,
                                    height: 64,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Bienvenido,',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Mundial',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Text(
                                          'Rafael',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontFamily: 'Mundial',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Cards(
                              title: "Mi cuenta",
                              description: "Datos personales y de vehículo.",
                              iconPath: "images/icons/Personal.png",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountScreen()));
                              },
                            ),
                            const SizedBox(height: 16),
                            Cards(
                              title: "Citas",
                              description:
                                  "Agenda, revisa o cancela tus citas.",
                              iconPath: "images/icons/citas_card.png",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CitasScreen()));
                              },
                            ),
                            const SizedBox(height: 16),
                            Cards(
                              title: "Historial",
                              description:
                                  "Documentación de todos los sevicios.",
                              iconPath: "images/icons/historial.png",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HistorialScreen()));
                              },
                            ),
                            SizedBox(height: screenHeight * 0.1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(initialIndex: 0),
          ),
        ],
      ),
    );
  }
}
