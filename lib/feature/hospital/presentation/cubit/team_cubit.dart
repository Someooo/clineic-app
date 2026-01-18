import '../../../../global_imports.dart';
import '../../domain/entities/team_entity.dart';
import '../../domain/usecases/get_team_list_case.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState>
    with CubitLifecycleMixin<TeamState> {
  final GetTeamListCase _getTeamListCase;
  CancelToken? _cancelToken;

  TeamCubit({required GetTeamListCase getTeamListCase})
    : _getTeamListCase = getTeamListCase,
      super(TeamState.initial);

  Future<void> getHospitalTeamList({
    required int userId,
    String status = 'approved',
    int pageNumber = 1,
    int showUsers = 10,
  }) async {
    emit(TeamState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getTeamListCase(
      userId: userId,
      status: status,
      pageNumber: pageNumber,
      showUsers: showUsers,
      cancelToken: _cancelToken!,
    );

    result.fold(
      (failure) {
        emit(TeamState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(
            TeamState.teamsLoaded(response.list!, response.description),
          );
        } else {
          emit(TeamState.teamsLoaded([], response.description));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
