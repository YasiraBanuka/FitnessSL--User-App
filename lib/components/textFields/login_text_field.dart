import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData suffixIcon;
  final VoidCallback onSuffixIconTap;
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.suffixIcon,
    required this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 20.0, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.only(left: 25.0, bottom: 10.0, top: 11.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.7),
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            color: Colors.black,
          ),
        ),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey.shade200)),
        // focusedBorder: const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.white)),
        // fillColor: Colors.grey[200],
        // filled: true,
        // hintText: hintText,
        // hintStyle: const TextStyle(
        //   color: Colors.grey,
        // ),
      ),
    );
  }
}
