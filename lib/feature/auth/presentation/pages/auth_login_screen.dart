import '../../../../global_imports.dart';
import '../cubit/password_visibility_cubit.dart';
import '../widget/auth_login_widget.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(AppStrings.login.tr()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [AppColor.tealColor, AppColor.blueColor],
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //   ),
          // ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: AppColor.blueColor,
            ),
            onPressed: () {
              final currentLocale = context.locale;
              final newLocale = currentLocale.languageCode == 'ar'
                  ? const Locale('en')
                  : const Locale('ar');
              context.setLocale(newLocale);
            },
            tooltip: 'Switch Language',
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (_) => PasswordVisibilityCubit()),
        ],
        child: AuthLoginWidget(),
      ),
    );
  }
}
