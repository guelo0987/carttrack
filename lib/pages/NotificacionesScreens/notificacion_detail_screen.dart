import 'package:carttrack/pages/NotificacionesScreens/notification2_detail2.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/components/CartTrackComponents/data_card.dart';
import 'package:carttrack/components/main_button.dart';

class NotificacionDetailScreen extends StatelessWidget {
  final String title;
  final String? details;
  final String timestamp;

  const NotificacionDetailScreen({
    super.key,
    required this.title,
    this.details,
    required this.timestamp,
  });

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$label:",
              style: TextStyle(
                color: Color(0xFF0500C6),
                fontSize: 16,
                fontFamily: 'Mundial',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  fontFamily: 'Mundial',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 1,
          color: Color(0xFF1D1A7C).withOpacity(0.1),
        ),
        SizedBox(height: 16),
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
                title: 'Notificación',
                icon: 'images/icons/notificaciones_header.png',
                widthA: 130.0,
              ),
              SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: BaseCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 22,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 32),
                              _buildInfoRow("Tipo de Cita", "Mantenimiento"),
                              _buildInfoRow("Fecha", "18-08-2024"),
                              _buildInfoRow("Hora", "11:30 AM"),
                              _buildInfoRow("Vehículo", "Tesla Model X 2023"),
                              _buildInfoRow("Taller", "Nombre del taller"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ave. John F. Kennedy 123",
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 16,
                                      fontFamily: 'Mundial',
                                    ),
                                  ),
                                  Text(
                                    "Ensanche Kennedy",
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 16,
                                      fontFamily: 'Mundial',
                                    ),
                                  ),
                                  Text(
                                    "Distrito Nacional",
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 16,
                                      fontFamily: 'Mundial',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  child: MainButton(
                                    text: "Solicitar Modificación",
                                    backgroundColor: Colors.white,
                                    textColor: Color(0xFF0500C6),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification2Detail2()));
                                    },
                                    borderColor: Color(0xFF0500C6),
                                    icon: Image.asset(
                                      'images/icons/phone_icon.png',
                                      width: 24,
                                      height: 24,
                                      color: Color(0xFF0500C6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              100), // Espacio para el Footer fuera de la card
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
              child: Footer(initialIndex: 4,)
          ),
        ],
      ),
    );
  }
}
