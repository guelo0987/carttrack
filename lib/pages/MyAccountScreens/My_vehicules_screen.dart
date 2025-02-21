import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/pages/CartTrackScreens/Vehicle_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/cards.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';

class MyVehiculesScreen extends StatelessWidget {

  MyVehiculesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF5FC),
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
                  )
                ],
              ),
              SizedBox(height: 30),
              Text("Vehículos Registrados",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Mundial',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0500C6))),
              SizedBox(height: 16),
              Cards(
                title: "Chevrolet Tahoe 2024",
                onTap: () => {},
                showMenuIcon: true,
                onEditTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleDetailScreen()))
                },
                height: 100,
              ),
              SizedBox(height: 16),
              Cards(
                title: "Tesla Model X 2023",
                onTap: () => {},
                showMenuIcon: true,
                onEditTap: () =>
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleDetailScreen()))
                },
                height: 100,
              ),
              SizedBox(height: 30),
              Image.asset('images/icons/addVehicle.png', width: 17, height: 17)
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
