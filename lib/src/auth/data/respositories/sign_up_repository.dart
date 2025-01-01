import 'package:dio/dio.dart';
import '../../../services/dio_client.dart';

class SignUpRepository {
  late DioClient dioClient;
  final String _baseUrl =
      "https://your-api-base-url.com"; // Replace with your actual base URL

  SignUpRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    const String endpoint = "/api/auth/register";
    final Map<String, String> payload = {
      "name": name,
      "email": email,
      "password": password,
    };

    try {
      final Response response = await dioClient.post(
        endpoint,
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          "success": response.data['success'],
          "message": response.data['message'],
        };
      } else {
        return {
          "success": false,
          "message": "Unexpected error occurred.",
        };
      }
    } catch (error) {
      if (error is DioException && error.response != null) {
        return {
          "success": false,
          "message":
              error.response?.data['message'] ?? "Unknown error occurred.",
        };
      }
      return {
        "success": false,
        "message": "Failed to connect to the server.",
      };
    }
  }
}
