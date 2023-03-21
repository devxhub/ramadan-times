import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:togumogu/src/services/app_localization.dart';
part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  const factory NetworkExceptions.receiveTimeout() = ReceiveTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.badCertificate() = BadCertificate;

  const factory NetworkExceptions.badResponse() = BadResponse;

  const factory NetworkExceptions.connectionTimeout() = ConnectionTimeout;

  const factory NetworkExceptions.connectionError() = ConnectionError;

  const factory NetworkExceptions.unknown() = Unknown;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(int statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
        return const NetworkExceptions.unauthorizedRequest();
      case 403:
        return const NetworkExceptions.unauthorizedRequest();
      case 404:
        return const NetworkExceptions.notFound("Not found");
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              // ignore: prefer_const_constructors
              networkExceptions = NetworkExceptions.requestCancelled();
              break;

            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.receiveTimeout();
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            // case DioErrorType.sendTimeout:
            //   break;
            // case DioErrorType.response:

            //   break;

            case DioErrorType.connectionTimeout:
              networkExceptions = const NetworkExceptions.connectionTimeout();
              break;
            case DioErrorType.badCertificate:
              networkExceptions = const NetworkExceptions.badCertificate();
              break;
            case DioErrorType.badResponse:
              networkExceptions = const NetworkExceptions.badResponse();

              break;
            case DioErrorType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.unknown:
              networkExceptions = const NetworkExceptions.unknown();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          // print("object>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        // Helper.printError(e.toString());
        return const NetworkExceptions.formatException();
      } catch (_) {
        // print("object>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        // print(error.toString());
        return const NetworkExceptions.unableToProcess();
      } else {
        // print(error.toString());
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorizedRequest: () {
      errorMessage = "Unauthorized request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not Acceptable";
    }, receiveTimeout: () {
      errorMessage = "Receive Timeout";
    }, connectionTimeout: () {
      errorMessage = "Connection Timeout";
    }, badCertificate: () {
      errorMessage = "Bad Certificate";
    }, badResponse: () {
      errorMessage = "Bad Response";
    }, unknown: () {
      errorMessage = "Unknown error occurred";
    }, connectionError: () {
      errorMessage = "Connection Error";
    });
    return errorMessage;
  }
}
