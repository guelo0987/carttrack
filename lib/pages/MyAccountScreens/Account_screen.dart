import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/pages/MyAccountScreens/Membresia_screen.dart';
import 'package:carttrack/pages/MyAccountScreens/My_vehicules_screen.dart';
import 'package:carttrack/pages/MyAccountScreens/Personal_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/cards.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

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
                height: 217, // Altura responsiva del header
                opacity: 0.2,
                showBackArrow: true,
                onBackPressed: () => Navigator.pop(context),
                backArrowColor: 'images/icons/left_arrow_white.png',
                title: 'Mi cuenta',
                icon: 'images/icons/account_user_header.png',
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Cards(
                          title: "Datos Personales",
                          description: "Información de contacto y documentos",
                          onTap: () => {},
                          showMenuIcon: true,
                          onEditTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalData(),
                              ),
                            )
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Cards(
                          title: "Mis Vehículos",
                          description: "Información de tus vehículos",
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyVehiculesScreen(),
                              ),
                            )
                          },
                          showMenuIcon: true,

                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Cards(
                          title: "Membresía",
                          description: "Información de tu membresía",
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MembresiaScreen(),
                              ),
                            )
                          },
                          showMenuIcon: true
                        ),
                        SizedBox(
                            height:
                                screenHeight * 0.1), // Espacio para el footer
                      ],
                    ),
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
