import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/pages/NotificacionesScreens/notificacion_detail_screen.dart';

class NotificacionesScreen extends StatelessWidget {
  NotificacionesScreen({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF0500C6),
            fontSize: 18,
            fontFamily: 'Mundial',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTimestamp(String time) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          time,
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 14,
            fontFamily: 'Mundial',
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String message,
    String? details,
    bool isNew = true,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificacionDetailScreen(
              title: message,
              details: details,
              timestamp: "Hoy, 9:15 AM",
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isNew ? Color(0xFF0500C6) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isNew
                ? []
                : [
                    BoxShadow(
                      color: Color(0xFFC8DCEA),
                      offset: Offset(0, 4),
                      blurRadius: 20,
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isNew ? Colors.white : Color(0xFF0500C6),
                  fontSize: 16,
                  fontFamily: 'Mundial',
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (details != null) ...[
                SizedBox(height: 8),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Mundial',
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
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
                showBackArrow: false,
                title: 'Notificaciones',
                icon: 'images/icons/notificaciones_header.png',
                widthA: 80.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 54),
                      _buildSectionTitle("Nuevas"),
                      _buildTimestamp("Hoy, 9:15 AM"),
                      SizedBox(height: 16),
                      _buildNotificationCard(
                        message: "Su cita ha sido agendada.",
                        details: "18-08-2024 | Taller Lorem Ipsum | 11:30 AM",
                        context: context,
                      ),
                      SizedBox(height: 16),
                      _buildNotificationCard(
                        message:
                            "Su factura para el mes de julio ha sido enviada.",
                        context: context,
                      ),
                      SizedBox(height: 40),
                      _buildSectionTitle("Anteriores"),
                      _buildTimestamp("Hoy, 9:15 AM"),
                      SizedBox(height: 16),
                      _buildNotificationCard(
                        message:
                            "Su factura para el mes de junio ha sido enviada.",
                        isNew: false,
                        context: context,
                      ),
                      SizedBox(height: 100),
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
