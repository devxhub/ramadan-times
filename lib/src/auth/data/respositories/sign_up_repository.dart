import 'package:dio/dio.dart';
import '../../../services/dio_client.dart';
import '../models/sign_up_response.dart';

class SignUpRepository {
  late DioClient dioClient;
  final String _baseUrl = "";

  SignUpRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<SignUpResponse> registerUser({
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

    var response = {
      "success": false,
      "message": "Unknown error occurred.",
    };
    return SignUpResponse.fromJson(response);
    // try {
    //   final Response response = await dioClient.post(
    //     endpoint,
    //     data: payload,
    //   );

    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     return SignUpResponse.fromJson(response.data);
    //   } else {
    //     return SignUpResponse(
    //       success: false,
    //       message: "Unexpected error occurred.",
    //     );
    //   }
    // } catch (error) {
    //   if (error is DioException && error.response != null) {
    //     return SignUpResponse.fromJson(
    //       error.response?.data ??
    //           {
    //             "success": false,
    //             "message": "Unknown error occurred.",
    //           },
    //     );
    //   }
    //   return SignUpResponse(
    //     success: false,
    //     message: "Failed to connect to the server.",
    //   );
    // }
  }
}
