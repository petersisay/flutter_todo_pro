class ApiConstants {
  /// Compile-time configurable API Base URL.
  /// Override at build/run time via:
  ///   flutter run --dart-define=API_BASE_URL=https://your-api-domain.com/api
  ///   or: flutter run --dart-define-from-file=.env.json
  static const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');

  /// Fallback development API endpoint when no runtime environment definition is provided.
  /// Developers must define API_BASE_URL in their local .env.json or pass via --dart-define.
  static const String _fallbackBaseUrl = 'https://api.petroflow.app/api';

  /// Resolved base URL for the backend API:
  /// Uses environment override if defined; otherwise falls back to generic secure endpoint.
  static String get defaultBaseUrl =>
      _envBaseUrl.isNotEmpty ? _envBaseUrl : _fallbackBaseUrl;

  // Local Development URLs (for emulator / local testing)
  static const String localAndroidEmulatorUrl = 'http://10.0.2.2:5000/api';
  static const String localIosSimulatorUrl = 'http://localhost:5000/api';

  // Connection Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
