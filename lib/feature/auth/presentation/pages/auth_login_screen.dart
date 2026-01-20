import '../../../../core/widget/app_widget/app_scaffold.dart';
import '../../../../core/utils/color.dart';
import '../../../../global_imports.dart';
import '../cubit/password_visibility_cubit.dart';
import '../../../../core/localization/locale_controller.dart';
import '../widget/auth_login_widget.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppScaffold(
      title: t.appName,
      showBackButton: false,
      gradient: const LinearGradient(
        colors: [AppColor.tealColor, AppColor.blueColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      appBar: AppBar(
        title: Text(t.appName, style: AppTextStyle.headLine1),
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
              LocaleController.of(context).toggle();
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
