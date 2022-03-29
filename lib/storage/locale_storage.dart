import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LanguageStorage {
  static const storage = FlutterSecureStorage();

  Future<String?> getLocaleFromStorage() async =>
      await storage.read(key: "languageCode");

  setLocale(String loc) {
    storage.write(key: "languageCode", value: loc);
  }
}
