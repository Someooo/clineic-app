import 'package:flutter/material.dart';

import '../../core/utils/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Clinic"),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
   
  }
} 