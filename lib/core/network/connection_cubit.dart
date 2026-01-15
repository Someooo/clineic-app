
import '../../global_imports.dart';
import '../localization/l10n.dart';

part 'connection_cubit.freezed.dart';
part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  final NetworkInfo networkInfo;

  ConnectionCubit(this.networkInfo) : super(const ConnectionInitial()) {
    _monitor();
  }

  void _monitor() {
    bool isFirstCheck = true;

    networkInfo.onConnectionChange.listen((connected) {
      if (isFirstCheck) {
        isFirstCheck = false;
        emit(connected ? const ConnectionOnline() : const ConnectionOffline());
        return;
      }

      if (connected) {
        if (state is! ConnectionOnline) {
          _showConnectedBar();
        }
        emit(const ConnectionOnline());
      } else {
        _showDisconnectedBar();
        emit(const ConnectionOffline());
      }
    });
  }

  void _showConnectedBar() {
    showBar(
      GlobalContext.navigatorKey.currentContext!,
      title: L10n.t.connected,
      message: L10n.t.internetConnectionRestored,
      contentType: BarContentType.success,
      position: BarPosition.top,
    );
  }

  void _showDisconnectedBar() {
    showBar(
      GlobalContext.navigatorKey.currentContext!,
      title: L10n.t.noInternet,
      message: L10n.t.youAreOffline,
      contentType: BarContentType.failure,
      position: BarPosition.top,
    );
  }
}
