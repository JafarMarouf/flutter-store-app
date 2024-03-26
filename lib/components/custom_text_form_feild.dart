import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final void Function(String)? onChanged;
  final String hintText;
  final TextInputType inputType;
  const CustomTextFeild(
      {required this.hintText,
      required this.inputType,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 20,
        ),
        labelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      onChanged: onChanged,
      keyboardType: inputType,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController customController;
  final String hintText;
  final TextInputType type;

  final bool isSuffix;
  final IconData? suffixIcon;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;
  const CustomTextFormField({
    super.key,
    required this.validate,

    required this.customController,
    required this.hintText,
    required this.type,
    required this.isSuffix,
    this.suffixIcon,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        suffixIcon: (isSuffix)?IconButton(
          onPressed:onPressedSuffix ,
          icon: Icon(suffixIcon),
        ):const Text(''),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 20,
        ),
        labelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      controller: customController,
      keyboardType: type,
      onChanged:onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
    );
  }
}
