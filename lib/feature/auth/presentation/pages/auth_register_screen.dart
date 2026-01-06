import '../../../../core/widget/app_widget/app_scaffold.dart';
import '../../../../core/utils/color.dart';
import '../../../../global_imports.dart';
import '../cubit/password_visibility_cubit.dart';
import '../widget/auth_register_widget.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "appName".tr(),
      showBackButton: true,
      gradient: const LinearGradient(
        colors: [AppColor.tealColor, AppColor.blueColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      appBar: AppBar(
        title: Text("appName".tr()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.tealColor, AppColor.blueColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
        titleTextStyle: const TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: AppColor.white,
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
    
        child: AuthRegisterWidget(),
      ),
    );
  }
}
