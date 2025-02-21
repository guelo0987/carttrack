import 'package:carttrack/pages/CartTrackScreens/Dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/go_back.dart';
import '../../components/main_button.dart';

class Register4Screen4 extends StatelessWidget {
  final String membershipType;
  const Register4Screen4({
    super.key,
    required this.membershipType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 1. Fondo transparente del Scaffold
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              top: false,
              minimum: EdgeInsets.zero,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            width: 326,
                            margin: const EdgeInsets.only(
                                top: 64, left: 25, right: 25),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withAlpha(51),
                                  Colors.white.withAlpha(26),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withAlpha(51),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('images/logo.png',
                                    width: 102, height: 88),
                                const SizedBox(height: 40),
                                Container(
                                  width: 278,
                                  height: 495,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Icono y tipo de membresía
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                'images/icons/left_arrow_blue.png',
                                                width: 19,
                                                height: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          'images/icons/${membershipType}.png',
                                          width: 18,
                                          height: 18,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Membresía $membershipType',
                                          style: const TextStyle(
                                            color: Color(0xFF0500C6),
                                            fontSize: 16,
                                            fontFamily: 'Mundial',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // Lista de beneficios
                                        Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 4,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        const Color(0xFF00DA7B),
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      'Lorem Ipsum dolo sit amet',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF0500C6),
                                                        fontSize: 14,
                                                        fontFamily: 'Mundial',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Texto informativo
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            'Tu membresía inicia al momento de agendar tu primera cita',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontFamily: 'Mundial',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        // Botón con tamaño ajustado
                                        MainButton(
                                          text: 'Elegir membresía',
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                                          },
                                          backgroundColor:
                                              const Color(0xFF0500C6),
                                          textColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
