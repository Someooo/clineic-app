import '../../../../global_imports.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';
import '../cubit/team_cubit.dart';
import '../widget/team_card.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';

class HospitalTeamPage extends StatelessWidget {
  final int profileId;

  const HospitalTeamPage({
    super.key,
    required this.profileId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TeamCubit>()..getHospitalTeamList(profileId: profileId),
        ),
        BlocProvider(
          create: (context) => getIt<WishlistCubit>(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.tealColor, AppColor.blueColor],
          ),
        ),
        child: Column(
          children: [
            CustomGradientAppBar(
              title: 'Hospital Team',
              showBackButton: true,
            ),
            // White Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F7FA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const HospitalTeamBody(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalTeamBody extends StatelessWidget {
  const HospitalTeamBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamCubit, TeamState>(
      builder: (context, state) {
        if (state.status == 'loading') {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == 'error') {
          return Center(
            child: Text(
              state.message ?? AppLocalizations.of(context)!.error,
              style: AppTextStyle.style14.copyWith(
                color: AppColor.red,
              ),
            ),
          );
        }

        if (state.status == 'teams_loaded') {
          final teams = state.teams;

          if (teams.isEmpty) {
            return const NoDataWidget(
              title: 'No team members found',
              subtitle: 'No team members are available at the moment',
            );
          }

          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return TeamCard(
                team: team,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
