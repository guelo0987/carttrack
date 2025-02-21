import 'package:carttrack/pages/AuthScreens/recover2_screen2.dart';
import 'package:carttrack/pages/AuthScreens/recover3_screen3.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/custom_form.dart';
import '../../components/main_button.dart';
import '../../components/go_back.dart';

class RecoverScreen extends StatefulWidget {
  RecoverScreen({Key? key}) : super(key: key);

  @override
  State<RecoverScreen> createState() => _RecoverScreenState();
}

class _RecoverScreenState extends State<RecoverScreen> {
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
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize
                                  .min, // 5. Evita expansión innecesaria
                              children: [
                                Image.asset('images/logo.png',
                                    width: 124, height: 107),
                                SizedBox(height: 40),
                                Text(
                                  'Recuperar Contraseña',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Mundial',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  'Si tienes una cuenta con nosotros, te enviaremos un correo de verificación con los siguientes pasos. ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Mundial',
                                  ),
                                ),
                                const SizedBox(height: 30),
                                CustomForm(formKey: formKey, fields: [
                                  {
                                    'label': 'Correo:',
                                    'controller': emailController,
                                    'validator': (value) {
                                      if (value?.isEmpty ?? true)
                                        return 'El correo es requerido';
                                      return null;
                                    },
                                  },
                                ], buttons: [
                                  MainButton(
                                    text: 'Enviar Correo',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        // Procesar formulario
                                      }

                                      //Cambiar el route de acuerdo a la logica del formulario, por ejemplo si no existe lo lleva al Recover Screen 3
                                      //Si si existe lo lleva al Recover Screen 2
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Recover2Screen2()));
                                    },
                                  ),
                                ]),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: BackArrowButton(
                                onPressed: () => Navigator.pop(context),
                                iconPath: 'images/icons/left_arrow_white.png',
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
