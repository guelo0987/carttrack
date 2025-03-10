import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/pages/CitasScreens/Programar_cita_screen.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/components/main_button.dart';

class CrearCitasScreen extends StatelessWidget {
  CrearCitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFEBF5FC),
      body: Stack(
        children: [
          Column(
            children: [
              Header(
                height: 217,
                opacity: 0.2,
                showBackArrow: true,
                onBackPressed: () => Navigator.pop(context),
                backArrowColor: 'images/icons/left_arrow_white.png',
                title: 'Citas',
                icon: 'images/icons/citas_header.png',
                widthA: 190.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.57),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MainButton(
                          text: 'Crear Cita',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProgramarCitaScreen()));
                          },
                          backgroundColor: const Color(0xFF0500C6),
                          textColor: Colors.white,
                          height: 80,
                          margin: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                          height: screenHeight * 0.1), // Espacio para el footer
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
            child: Footer(initialIndex: 1),
          ),
        ],
      ),
    );
  }
}
