import 'package:carttrack/pages/AuthScreens/register2_screen2.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/custom_form.dart';
import '../../components/main_button.dart';
import '../AuthScreens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 1. Fondo transparente del Scaffold
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('images/logo.png',
                                width: 124, height: 107),
                            const SizedBox(height: 40),
                            Text(
                              'Crea una Cuenta',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Mundial',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 250,
                              child: LinearProgressIndicator(
                                value:
                                    0.4, // Aquí controlarás el progreso (0.0 a 1.0)
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF0500C6)),
                                minHeight: 3,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomForm(formKey: formKey, fields: [
                              {
                                'label': 'Correo:',
                                'controller': emailController,
                                'validator': (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'El correo es requerido';
                                  }
                                  return null;
                                },
                              },
                              {
                                'label': 'Contraseña:',
                                'controller': passwordController,
                                'isPassword': true,
                                'validator': (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'La contraseña es requerida';
                                  }
                                  return null;
                                },
                              },
                              {
                                'label': 'Repetir Contraseña:',
                                'controller': passwordController,
                                'isPassword': true,
                                'validator': (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'La contraseña es requerida';
                                  }
                                  return null;
                                },
                              },
                            ], buttons: [
                              MainButton(
                                text: 'Crear cuenta',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // Procesar formulario
                                  }

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Register2Screen2()));
                                },
                              ),
                              MainButton(
                                text: 'Iniciar Sesión',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                transparent: true,
                                textColor: Colors.white,
                                borderColor: Colors.white,
                              ),
                            ]),
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
