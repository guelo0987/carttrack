import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/components/CartTrackComponents/data_card.dart';
import 'package:carttrack/components/main_button.dart';

class MembresiaScreen extends StatelessWidget {
  const MembresiaScreen({super.key});

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
                child: ListView(
                  children: [
                    const SizedBox(height: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: BaseCard(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Membresía CarTrac",
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 20,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
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
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Icon(Icons.person_outline,
                                      color: Color(0xFF0500C6)),
                                  SizedBox(width: 8),
                                  Text(
                                    "Membresía Personal",
                                    style: TextStyle(
                                      color: Color(0xFF0500C6),
                                      fontSize: 14,
                                      fontFamily: 'Mundial',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withAlpha(51),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      "Activa",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                        fontFamily: 'Mundial',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14),
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
                              SizedBox(height: 14),
                              Text(
                                "Incluido en tu membresía:",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              _buildBenefitItem("Lorem Ipsum dolo sit amet"),
                              _buildBenefitItem("Lorem Ipsum dolo sit amet"),
                              _buildBenefitItem("Lorem Ipsum dolo sit amet"),
                              _buildBenefitItem("Lorem Ipsum dolo sit amet"),
                              SizedBox(height: 10),
                              Center(
                                child: MainButton(
                                  text: 'Programa de mantenimiento',
                                  onPressed: () {},
                                  backgroundColor: Color(0xFF0500C6),
                                  textColor: Colors.white,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Tu membresía inicia al momento de\nagendar tu primera cita",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontFamily: 'Mundial',
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Center(
                                child: MainButton(
                                  text: 'Cancelar Membresía',
                                  onPressed: () {},
                                  textColor: Color(0xFFB5C7D3),
                                  borderColor: Color(0xFFB5C7D3),
                                  backgroundColor: Colors.white,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFFEBF5FC),
              child: const Footer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Image.asset(
            'images/icons/check.png',
            width: 16,
            height: 16,
            color: Colors.green,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontFamily: 'Mundial',
            ),
          ),
        ],
      ),
    );
  }
}
