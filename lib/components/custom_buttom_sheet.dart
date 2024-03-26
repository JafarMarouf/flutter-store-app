// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'custom_text_form_feild.dart';

class CustomButtomSheet extends StatelessWidget {
  CustomButtomSheet({super.key});
  String? title, desc, price, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      // decoration: BoxDecoration(color: Colors.red),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFeild(
              hintText: 'Product Title',
              inputType: TextInputType.text,
              onChanged: (data) {
                title = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeild(
              hintText: 'Product Description',
              inputType: TextInputType.text,
              onChanged: (data) {
                desc = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeild(
              hintText: 'Product price',
              inputType: TextInputType.number,
              onChanged: (data) {
                price = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFeild(
              hintText: 'Product Image',
              inputType: TextInputType.text,
              onChanged: (data) {
                image = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                
              },
              color: const Color.fromARGB(255, 245, 77, 5),
              child: const Text(
                'Update Product',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
