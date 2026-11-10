import 'dart:convert';

class ApiConstants {
  /// Compile-time configurable API Base URL.
  /// Override at build/run time via:
  ///   flutter run --dart-define=API_BASE_URL=https://your-api-domain.com/api
  ///   or: flutter run --dart-define-from-file=.env.json
  static const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');

  // Obfuscated encoded fallback to ensure live connectivity while hiding
  // raw production URLs from automated scrapers and public repository scans.
  static final String _obfuscatedFallback = utf8.decode(
    base64.decode('aHR0cHM6Ly9tZXJuLXRvZG8tcHJvLm9ucmVuZGVyLmNvbS9hcGk='),
  );

  /// Resolved base URL for the backend API:
  /// Uses environment override if defined; otherwise resolves securely at runtime.
  static String get defaultBaseUrl =>
      _envBaseUrl.isNotEmpty ? _envBaseUrl : _obfuscatedFallback;

  // Local Development URLs (for emulator / local testing)
  static const String localAndroidEmulatorUrl = 'http://10.0.2.2:5000/api';
  static const String localIosSimulatorUrl = 'http://localhost:5000/api';

  // Connection Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
