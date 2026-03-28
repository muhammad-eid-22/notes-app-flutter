import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';

class CustomIconBotton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;

  const CustomIconBotton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Bounceable(onTap: onTap, child: icon);
  }
}
