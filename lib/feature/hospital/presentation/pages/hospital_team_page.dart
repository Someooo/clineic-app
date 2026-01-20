import '../../../../global_imports.dart';
import '../cubit/team_cubit.dart';
import '../widget/team_card.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class HospitalTeamPage extends StatelessWidget {
  final int profileId;

  const HospitalTeamPage({
    super.key,
    required this.profileId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TeamCubit>()..getHospitalTeamList(profileId: profileId),
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
            // Header Section
            Container(
              width: double.infinity,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textDirection: Directionality.of(context),
                        children: [
                          if (Localizations.localeOf(context).languageCode == 'en')
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Hospital Team',
                              style: AppTextStyle.style24B.copyWith(
                                color: AppColor.white,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: Localizations.localeOf(context).languageCode == 'en' 
                                  ? TextAlign.left 
                                  : TextAlign.right,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (Localizations.localeOf(context).languageCode == 'ar')
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
