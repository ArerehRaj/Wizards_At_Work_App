import 'package:flutter/material.dart';

import '../options_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key, required this.categoryType});
  final categoryType;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return OptionsScreen(categoryType: widget.categoryType);
  }
}
