import '../../../../global_imports.dart';
import '../../../../core/utils/border_radius.dart';
import '../../../../core/localization/l10n.dart';

class AuthActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool showRegisterLink;

  const AuthActionButton({
    super.key,
    required this.onTap,
    required this.text,
    this.showRegisterLink = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (auth, message) {
            showBar(
              context,
              title: L10n.t.hello(auth.fullName),
              message: message,
              contentType: BarContentType.success,
            );
            context.go(AppRoutes.home);
          },
          loginSuccess: (message) {
            showBar(
              context,
              title: L10n.t.register,
              message: message,
              contentType: BarContentType.success,
            );
            context.go(AppRoutes.home);
          },
          error: (msg, title) {
            showBar(
              context,
              title: L10n.t.error,
              message: msg,
              contentType: BarContentType.failure,
            );
          },
        );
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColor.tealColor, AppColor.blueColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(AppBorderRadius.sm8),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppBorderRadius.sm8),
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (showRegisterLink) ...[
              35.gap,
              GestureDetector(
                onTap: () {
                  context.go(AppRoutes.register);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style:const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: L10n.t.dontHaveAccount),
                      TextSpan(
                        text: L10n.t.goToRegister,
                        style:const TextStyle(
                          color: AppColor.blueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                   
                    ],
                  ),
                ),
              ),
             30.gap,
            ],
          ],
        );
      },
    );
  }
}
