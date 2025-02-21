import 'package:carttrack/pages/AuthScreens/register_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/go_back.dart';
import '../../components/main_button.dart';

class Recover3Screen3 extends StatelessWidget {
  Recover3Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
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
                        height: 683,
                        margin:
                            const EdgeInsets.only(top: 64, left: 25, right: 25),
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
                        child: Stack(
                          children: [
                            // Contenido centrado
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Recuperar contraseña',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Mundial',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Text(
                                      'Lo sentimos, example@example correo no está registrado en CarTrac.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                        fontFamily: 'Mundial',
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  MainButton(
                                    text: 'Crear cuenta',
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: BackArrowButton(
                                onPressed: () => Navigator.pop(context),
                                  iconPath: 'images/icons/left_arrow_white.png'
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
    );
  }
}
