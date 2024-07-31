import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyKitaScreen extends StatelessWidget {
  const MyKitaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Kita"),
    );
  }
}
