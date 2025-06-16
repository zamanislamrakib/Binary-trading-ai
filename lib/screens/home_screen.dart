import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Binary Trading AI"),
      ),
      body: const Center(
        child: Text("Welcome to Binary AI Home"),
      ),
    );
  }
}
