import 'package:flutter/material.dart';

class Language {
  final String title;
  final String subtitle;
  bool select = false;
  IconData icon = Icons.add_box_outlined;

  Language(this.title, this.subtitle);
}
