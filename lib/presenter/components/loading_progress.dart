import 'package:flutter/material.dart';

class MyLoading extends StatefulWidget {
  const MyLoading({super.key});

  @override
  State<MyLoading> createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.deepPurple,
    );
  }
}