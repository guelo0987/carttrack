import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/pages/CitasScreens/Programar_cita_screen.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/components/main_button.dart';

class SolicitarDetailScreen extends StatelessWidget {
  SolicitarDetailScreen({super.key});

  Widget _buildInfoRow({required String label, required String value}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "$label: ",
                  style: TextStyle(
                    color: Color(0xFF0500C6),
                    fontSize: 16,
                    fontFamily: 'Mundial',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  value,
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontFamily: 'Mundial',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 350,
          height: 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF1D1A7C).withAlpha(26),
              width: 2,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                widthA: 90.0,
              ),
              SizedBox(height: 54),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Solicita una Cita",
                    style: TextStyle(
                      color: Color(0xFF0500C6),
                      fontSize: 30,
                      fontFamily: 'Mundial',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 54),
              _buildInfoRow(label: "Tipo de Cita:", value: "Mantenimiento"),
              _buildInfoRow(label: "Fecha:", value: "18/18/1999"),
              _buildInfoRow(label: "Hora:", value: "11:30 AM"),
              _buildInfoRow(label: "Vehículo:", value: "Tesla Model X 2023"),
              SizedBox(height: 20),
              MainButton(
                text: "Solicitar Cita",
                backgroundColor: Color(0xFF0500C6),
                textColor: Colors.white,
                onPressed: () {
                  // Aquí puedes agregar la lógica para manejar el botón
                },
              ),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
              child: Footer(initialIndex: 1),
          )
        ],
      ),
    );
  }
}
