// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.keyboardType = TextInputType.name,
    this.icon,
    this.iconPrifex,
    this.padding = 10,
    required this.hintText,
    required this.isVissabileContent,
    required this.validate,
    required this.controller,
    this.autoFoucs = false,
  });
  final Widget? icon;
  final Widget? iconPrifex;

  final String hintText;
  final bool isVissabileContent;
  final bool autoFoucs;
  final String? Function(String? val) validate;
  final double padding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        autofocus: autoFoucs,
        controller: controller,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isVissabileContent,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: padding),
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            suffix: icon,
            prefixIcon: iconPrifex,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Colors.cyanAccent, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.cyanAccent)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.cyanAccent)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.cyanAccent))),
      ),
    );
  }
}
