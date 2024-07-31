import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MySukiScreen extends StatelessWidget {
  const MySukiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Suki"),);
  }
}