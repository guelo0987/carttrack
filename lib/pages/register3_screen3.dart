import 'package:carttrack/components/main_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:carttrack/pages/register4_screen4.dart';
import 'package:carttrack/components/go_back.dart';

class Register3Screen3 extends StatelessWidget {
  const Register3Screen3({super.key});

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
                                  'Membresía',
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
                                    value: 1.0,
                                    backgroundColor: Colors.white,
                                    valueColor:
                                    const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF0500C6)),
                                    minHeight: 3,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const SizedBox(height: 30),
                                MainButton(
                                  text: 'Personal',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const Register4Screen4(
                                            membershipType: 'Personal'),
                                      ),
                                    );
                                  },
                                  icon: Image.asset(
                                      'images/icons/Personal.png',
                                      width: 24,
                                      height: 24),
                                  transparent: false,
                                  textColor: const Color(0xFF0500C6),
                                  borderColor: Colors.white,
                                ),
                                const SizedBox(height: 16),
                                MainButton(
                                  text: 'Familiar',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const Register4Screen4(
                                            membershipType: 'Familiar'),
                                      ),
                                    );
                                  },
                                  icon: Image.asset(
                                      'images/icons/Familiar.png',
                                      width: 24,
                                      height: 24),
                                  transparent: false,
                                  textColor: const Color(0xFF0500C6),
                                  borderColor: Colors.white,
                                ),
                                const SizedBox(height: 16),
                                MainButton(
                                  text: 'Empresarial',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const Register4Screen4(
                                            membershipType: 'Empresarial'),
                                      ),
                                    );
                                  },
                                  icon: Image.asset(
                                      'images/icons/Empresarial.png',
                                      width: 24,
                                      height: 24),
                                  transparent: false,
                                  textColor: const Color(0xFF0500C6),
                                  borderColor: Colors.white,
                                ),
                              ],
                            ),
                            // Position the BackArrowButton using Stack and Positioned
                        Positioned(
                          left: 0,
                          top: 0,
                          child: BackArrowButton(
                              onPressed: () => Navigator.pop(context),
                            )
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