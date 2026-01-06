import '../../global_imports.dart';
import 'language/ar.dart';
import 'language/en.dart';

class Translation {
  static const Map<String, dynamic> translations = {'en': enLan, 'ar': arLan};
}

class CodeAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final translations = Translation.translations[locale.languageCode];
    if (translations != null) {
      return translations;
    }
    // Fallback to English if locale not found
    return Translation.translations['en']!;
  }
}
