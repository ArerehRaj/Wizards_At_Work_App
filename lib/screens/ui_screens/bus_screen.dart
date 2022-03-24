import 'package:flutter/material.dart';

import '../options_screen.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({Key? key, required this.categoryType});
  final categoryType;

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    return OptionsScreen(categoryType: widget.categoryType);
  }
}
