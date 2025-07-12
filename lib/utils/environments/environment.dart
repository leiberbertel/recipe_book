import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String baseUrl = _get("API_HOST");

  static String _get(String key) {
    return dotenv.get(key, fallback: "");
  }
}
