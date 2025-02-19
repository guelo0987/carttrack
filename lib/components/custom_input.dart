import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInput({
    Key? key,
    required this.label,
    this.isPassword = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) {
        setState(() {
          isFocused = focused;
        });
      },
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        validator: widget.validator,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Mundial',
        ),
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: TextStyle(
              color: Colors.white.withAlpha(isFocused ? 77 : 250),
              fontFamily: 'Mundial',
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withAlpha(179)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorStyle: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
