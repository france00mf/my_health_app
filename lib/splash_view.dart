
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health_app/onboard_view.dart';
import 'package:my_health_app/presenter/components/loading_progress.dart';

class SpashView extends StatefulWidget {
  const SpashView({super.key});

  @override
  State<SpashView> createState() => _SpashViewState();
}

class _SpashViewState extends State<SpashView> {
  @override
  void initState() {
    Timer(Duration.zero, () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> OnboardView()), (route) => false);
     });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Column(
        children: [
          MyLoading()
        ],
      ),
    );
  }
}