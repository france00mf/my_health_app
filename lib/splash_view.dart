
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health_app/onboard_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration.zero, () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> OnboardView()), (route) => false);
     });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}