import 'package:flutter/material.dart';
import '../../../../core/utils/color.dart';
import '../../../../global_imports.dart';
import '../cubit/profile_cubit.dart';
import '../widget/profile_widget.dart';

/// ProfileScreen - Displays user profile data from login response
/// 
/// Data Flow:
/// 1. User logs in → Login API returns user data (first_name, last_name, email, token, etc.)
/// 2. User data saved to AuthLocalDataSource (local storage)
/// 3. ProfileCubit loads data from AuthLocalDataSource
/// 4. ProfileWidget displays data from ProfileCubit.state.user
/// 
/// No API calls - purely displays data from login response
/// RTL/LTR Support: Inherited from MaterialApp locale settings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..loadProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: AppColor.backgroundColor,
        ),
        body: const ProfileWidget(),
      ),
    );
  }
}
