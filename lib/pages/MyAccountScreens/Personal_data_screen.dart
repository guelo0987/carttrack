import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/components/CartTrackComponents/data_card.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF5FC),
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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BaseCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Datos Personales",
                            style: TextStyle(
                              color: Color(0xFF0500C6),
                              fontSize: 20,
                              fontFamily: 'Mundial',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Manejar la edición aquí
                            },
                            child: Image.asset(
                              'images/icons/edit_icon.png',
                              width: 19,
                              height: 19,
                              color: const Color(0xFF0500C6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 250,
                        height: 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF1D1A7C).withAlpha(26),
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildDataRow("Nombre:", "Rafael Rivas"),
                      _buildDataRow("Correo:", "example@example.com"),
                      _buildDataRow("Teléfono:", "(829) 123-1234"),
                      _buildDataRow("Dirección:",
                          "Ave. José Contreras 45,\nDistrito Nacional"),
                      _buildDataRow("Cédula:", "Archivo cargado",
                          showIcons: true),
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
            child: Footer(),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {bool showIcons = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
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
