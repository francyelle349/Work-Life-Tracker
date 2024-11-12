import 'package:flutter/material.dart';

class StatusSnackBar extends SnackBar {
  StatusSnackBar(String title)
      : super(
          content: Text(title),
          duration: const Duration(seconds: 1),
        );
}