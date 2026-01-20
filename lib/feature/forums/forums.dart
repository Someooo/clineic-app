import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_imports.dart';
import 'forums_barrel.dart';

class ForumsPageWrapper extends StatelessWidget {
  const ForumsPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForumsCubit>(),
      child: const ForumsPage(),
    );
  }
}