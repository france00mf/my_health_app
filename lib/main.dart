import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health_app/splash_view.dart';

main(){

 runApp(MyWidget()); 
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

