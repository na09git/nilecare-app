import 'package:flutter/material.dart';




class SymptomsPage extends StatelessWidget {
  const SymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptoms'),
      ),
      body: const Center(
        child: Text('Symptoms'),
      ),
    );
  }
}