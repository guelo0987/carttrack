import 'package:carttrack/pages/AuthScreens/register3_screen3.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/custom_form.dart';
import '../../components/main_button.dart';
import 'package:flutter/services.dart';
import 'package:easy_mask/easy_mask.dart';
import '../../components/go_back.dart';

class Register2Screen2 extends StatefulWidget {
  const Register2Screen2({Key? key}) : super(key: key);

  @override
  State<Register2Screen2> createState() => _Register2Screen2State();
}

class _Register2Screen2State extends State<Register2Screen2> {
  final formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final telefonoController = TextEditingController();
  final cedulaController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    telefonoController.dispose();
    cedulaController.dispose();
    super.dispose();
  }

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
        )),
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
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('images/logo.png',
                                    width: 124, height: 107),
                                const SizedBox(height: 40),
                                const Text(
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
                                    value: 0.7,
                                    backgroundColor: Colors.white,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color(0xFF0500C6)),
                                    minHeight: 3,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                CustomForm(formKey: formKey, fields: [
                                  {
                                    'label': 'Nombre:',
                                    'controller': nombreController,
                                    'validator': (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'El nombre es requerido';
                                      }
                                      return null;
                                    },
                                  },
                                  {
                                    'label': 'Apellido:',
                                    'controller': apellidoController,
                                    'validator': (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'El apellido es requerido';
                                      }
                                      return null;
                                    },
                                  },
                                  {
                                    'label': 'Teléfono:',
                                    'controller': telefonoController,
                                    'keyboardType': TextInputType.phone,
                                    'inputFormatters': [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                      TextInputMask(
                                        mask: '9999999999',
                                      ),
                                    ],
                                    'validator': (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'El teléfono es requerido';
                                      }
                                      if (value!.length < 10) {
                                        return 'Ingrese un teléfono válido';
                                      }
                                      return null;
                                    },
                                  },
                                  {
                                    'label': 'Cédula:',
                                    'controller': cedulaController,
                                    'keyboardType': TextInputType.number,
                                    'inputFormatters': [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                      TextInputMask(
                                        mask: '999-9999999-9',
                                      ),
                                    ],
                                    'validator': (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'La cédula es requerida';
                                      }
                                      if (value!.length < 11) {
                                        return 'Ingrese una cédula válida';
                                      }
                                      return null;
                                    },
                                  },
                                ], buttons: [
                                  MainButton(
                                    text: 'Continuar',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Register3Screen3()));
                                      }
                                    },
                                  )
                                ]),
                              ],
                            ),
                            // Botón de regreso posicionado
                            Positioned(
                              left: 0,
                              top: 0,
                              child: BackArrowButton(
                                  onPressed: () => Navigator.pop(context),
                                  iconPath:
                                      'images/icons/left_arrow_white.png'),
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
