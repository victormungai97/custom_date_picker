// lib/views/home/components/button.dart

import 'package:custom_date_picker/constants/constants.dart';

import 'package:flutter/material.dart';

/// Widget to redirect to landing page
class HomeButton extends StatelessWidget {
  /// Constructor
  const HomeButton({super.key, this.onTap, this.text = ''});

  /// Function to execute when pressed
  final VoidCallback? onTap;

  /// Information on button
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 396,
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.logoColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
