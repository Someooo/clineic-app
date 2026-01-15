import '../../global_imports.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  static const Locale english = Locale('en');
  static const Locale arabic = Locale('ar');
  static const _prefsKey = 'locale_code';

  Locale _locale = arabic;
  Locale get locale => _locale;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefsKey);
    if (code == english.languageCode) {
      _locale = english;
    } else if (code == arabic.languageCode) {
      _locale = arabic;
    }
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, locale.languageCode);
  }

  Future<void> toggle() {
    final next = _locale.languageCode == arabic.languageCode ? english : arabic;
    return setLocale(next);
  }

  static LocaleController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_LocaleScope>();
    assert(scope != null, 'LocaleController not found in widget tree');
    return scope!.notifier!;
  }
}

class _LocaleScope extends InheritedNotifier<LocaleController> {
  const _LocaleScope({required super.notifier, required super.child});
}

class LocaleScope extends StatelessWidget {
  final LocaleController controller;
  final Widget child;

  const LocaleScope({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _LocaleScope(notifier: controller, child: child);
  }
}
