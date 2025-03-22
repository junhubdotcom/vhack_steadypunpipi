import 'package:flutter/material.dart';

class VoucherModel {
  final String title;
  final String subtitle;
  final String validity;
  final IconData icon;
  final String buttonText;

  VoucherModel({
    required this.title,
    required this.subtitle,
    required this.validity,
    required this.icon,
    required this.buttonText,
  });
}