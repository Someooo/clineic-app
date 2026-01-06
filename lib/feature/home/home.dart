import 'package:flutter/material.dart';

import '../../core/utils/color.dart';
import 'presentation/widget/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Clinic"),
        backgroundColor: AppColor.backgroundColor,
      ),
      drawer: const CustomSidebar(),
      body: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
   
  }
} 