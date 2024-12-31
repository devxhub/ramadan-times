
import 'package:dio/dio.dart';
import '../../../services/dio_client.dart';
import 'package:http/http.dart' as http;

class SignInRepository {
  late DioClient dioClient;
  final String _baseUrl = "";

  SignInRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }


}
