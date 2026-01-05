import '../../../../global_imports.dart';
import '../../../../core/utils/border_radius.dart';

class AuthActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const AuthActionButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (auth, message) {
            showBar(
              context,
              title: AppStrings.hello.tr(args: [auth.name]),
              message: message,
              contentType: BarContentType.success,
            );
            context.go(AppRoutes.home);
          },
          loginSuccess: (message) {
            showBar(
              context,
              title: AppStrings.login.tr(),
              message: message,
              contentType: BarContentType.success,
            );
            context.go(AppRoutes.home);
          },
          error: (msg, title) {
            showBar(
              context,
              title: AppStrings.error.tr(args: ['']),
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
            25.gap,
            GestureDetector(
              onTap: () {
                context.go(AppRoutes.register);
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: AppStrings.dontHaveAccount.tr()),
                    TextSpan(
                      text: AppStrings.goToRegister.tr(),
                      style: TextStyle(
                        color: AppColor.blueColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
