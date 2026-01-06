import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_imports.dart';
import '../cubit/home_cubit.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // TODO: Implement widget UI
        return const Center(
          child: Text('Home Widget - TODO: Implement UI'),
        );
      },
    );
  }
}
