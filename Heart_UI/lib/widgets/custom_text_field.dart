import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({super.key, 
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), 
            blurRadius: 10, 
            offset: const Offset(0, 5), // Position of the shadow (x, y)
          ),
        ],
        borderRadius: BorderRadius.circular(20), 
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black, 
            fontFamily: 'Poppins',
            fontSize: 20.0,
          ),
          filled: true,
          fillColor: Colors.white, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none, 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.accentColor, // Border color when focused
              width: 2.0, // Width of the focused border
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
        ),
        style: const TextStyle(
          color: Colors.black, 
        ),
      ),
    );
  }
}
