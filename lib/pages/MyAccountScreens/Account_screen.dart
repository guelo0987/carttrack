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
    return Scaffold(
      backgroundColor:  Color(0xFFEBF5FC),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Header(
                    height: 217,
                    opacity: 0.2,
                    showBackArrow: true,
                    onBackPressed: () => Navigator.pop(context),
                    backArrowColor: 'images/icons/left_arrow_white.png',
                    title: 'Mi cuenta',
                    icon: 'images/icons/account_user_header.png',
                  ),
                ],
              ),
              SizedBox(height: 30),
              Cards(
                title: "Datos Personales",
                description: "Información de contacto y documentos",
                onTap: () => {},
                showMenuIcon: true,
                onEditTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalData()))
                },
              ),
              SizedBox(height: 16),
              Cards(
                title: "Vehículos Registrados",
                description: "Información de tus vehículos.",
                showMenuIcon: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyVehiculesScreen()));
                },
              ),
              SizedBox(height: 16),
              Cards(
                title: "Membresía CarTrack",
                description: "Información de contacto y documentos.",
                showMenuIcon: true,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MembresiaScreen()));
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
