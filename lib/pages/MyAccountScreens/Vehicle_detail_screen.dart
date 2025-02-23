import 'package:carttrack/components/CartTrackComponents/data_card.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';

class VehicleDetailScreen extends StatelessWidget {
  VehicleDetailScreen({
    super.key,
  });

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
                title: 'Mi cuenta',
                icon: 'images/icons/account_user_header.png',
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: BaseCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Vehículo Registrado",
                                    style: TextStyle(
                                      color: Color(0xFF0500C6),
                                      fontSize: 20,
                                      fontFamily: 'Mundial',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 250,
                                height: 2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color(0xFF1D1A7C).withAlpha(26),
                                    width: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildDataRow("Marca:", "Chevrolet"),
                              _buildDataRow("Modelo:", "Tahoe"),
                              _buildDataRow("Año:", "2024"),
                              _buildDataRow("Placa:", "FLA4444"),
                              _buildDataRow("Color:", "Navy"),
                              _buildDataRow("Kilometraje:", "5,000 Km."),
                              _buildDataRow("Seguro:", "Archivo Cargado",
                                  showIcons: true),
                              Container(
                                width: 250,
                                height: 2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color(0xFF1D1A7C).withAlpha(26),
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                "Fotos: ",
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 14,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      width: 54,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEBF5FC),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      width: 54,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEBF5FC),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
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

  Widget _buildDataRow(String label, String value, {bool showIcons = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF0500C6),
                fontSize: 14,
                fontFamily: 'Mundial',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontFamily: 'Mundial',
              ),
            ),
          ),
          if (showIcons)
            Row(
              children: [
                Image.asset('images/icons/check.png', width: 12, height: 12),
                const SizedBox(width: 12),
                Image.asset('images/icons/eye.png', width: 12, height: 12),
                const SizedBox(width: 12),
                Image.asset('images/icons/more.png', width: 12, height: 12),
              ],
            ),
        ],
      ),
    );
  }
}
