import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  Widget _buildYearTitle(String year) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top: 24.0),
      child: Text(
        year,
        style: TextStyle(
          color: Color(0xFF0500C6),
          fontSize: 24,
          fontFamily: 'Mundial',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHistorialCard({
    required String tipoServicio,
    required String vehiculoFecha,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFC8DCEA),
              offset: Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tipoServicio,
              style: TextStyle(
                color: Color(0xFF0500C6),
                fontSize: 16,
                fontFamily: 'Mundial',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              vehiculoFecha,
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 14,
                fontFamily: 'Mundial',
              ),
            ),
          ],
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
                showBackArrow: true,
                onBackPressed: () => Navigator.pop(context),
                backArrowColor: 'images/icons/left_arrow_white.png',
                title: 'Historial',
                icon: 'images/icons/notificaciones_header.png',
                widthA: 90.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildYearTitle("2024"),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
                      ),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
                      ),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
                      ),
                      _buildYearTitle("2023"),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
                      ),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
                      ),
                      _buildHistorialCard(
                        tipoServicio: "Reparación",
                        vehiculoFecha: "Tahoe 2024 | 01-08-23",
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
            child: Footer(
              initialIndex: 3,
            ),
          ),
        ],
      ),
    );
  }
}
