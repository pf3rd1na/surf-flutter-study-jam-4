import 'package:http/http.dart' as http;

const kBaseUrl = 'eightballapi.com';

/// Class for making http requests.
class HttpManager {
  /// Makes http request with [kBaseUrl] and returns [http.Response].
  ///
  /// Returns a [Future] that completes with a [http.Response] object.
  static Future<http.Response> makeRequest() async {
    return http.get(
      Uri.https(kBaseUrl, '/api'),
    );
  }
}
