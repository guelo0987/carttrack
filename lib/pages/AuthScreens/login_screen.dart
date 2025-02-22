import 'package:carttrack/pages/AuthScreens/recover_screen.dart';
import 'package:carttrack/pages/AuthScreens/register_screen.dart';
import 'package:carttrack/pages/MyAccountScreens/Dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/custom_form.dart';
import '../../components/main_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            fit: BoxFit.cover, // 2. Asegura que cubra todo el espacio
          ),
        ),
        child: SafeArea(
          bottom: false,
          // 3. Eliminar padding superior si es necesario
          top: false, // <-- Añade esto
          minimum: EdgeInsets.zero, //
          child: SingleChildScrollView(
            physics:
                const ClampingScrollPhysics(), // Mejor comportamiento de scroll
            child: Container(
              // 4. Forzar altura completa
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
                          mainAxisSize: MainAxisSize
                              .min, // 5. Evita expansión innecesaria
                          children: [
                            Image.asset('images/logo.png',
                                width: 124, height: 107),
                            SizedBox(height: 40),
                            Text(
                              'Inicia Sesión',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Mundial',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            CustomForm(
                              formKey: formKey,
                              fields: [
                                {
                                  'label': 'Correo:',
                                  'controller': emailController,
                                  'validator': (value) {
                                    if (value?.isEmpty ?? true)
                                      return 'El correo es requerido';
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
                              ],
                              buttons: [
                                MainButton(
                                  text: 'Acceder',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // Procesar formulario
                                    }
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                                  },
                                ),
                                MainButton(
                                  text: 'Crear una cuenta',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  transparent: true,
                                  textColor: Colors.white,
                                  borderColor: Colors.white,
                                ),
                              ],
                              extraWidgets: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RecoverScreen()));
                                  },
                                  child: const Text(
                                    'He olvidado mi contraseña',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mundial',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
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
