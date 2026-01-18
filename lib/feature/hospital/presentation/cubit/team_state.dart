part of 'team_cubit.dart';

class TeamState {
  final String status;
  final String? message;
  final List<TeamEntity> teams;

  const TeamState({
    required this.status,
    this.message,
    this.teams = const [],
  });

  static const TeamState initial = TeamState(status: 'initial');
  static const TeamState loading = TeamState(status: 'loading');

  static TeamState teamsLoaded(
    List<TeamEntity> teams,
    String message,
  ) {
    return TeamState(
      status: 'teams_loaded',
      teams: teams,
      message: message,
    );
  }

  static TeamState error({required String message}) {
    return TeamState(status: 'error', message: message);
  }
}
