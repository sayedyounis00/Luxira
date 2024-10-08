// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:luxira/core/helper/networking/api_constants.dart';

class ApiErrorHandler {
  String getError(int statusCode) {
    switch (statusCode) {
      case ResponseCode.INTERNAL_SERVER_ERROR:
        return ResponseMessage.INTERNAL_SERVER_ERROR;
      case ResponseCode.API_LOGIC_ERROR:
        return 'API_LOGIC_ERROR';
      case ResponseCode.BAD_REQUEST:
        return ResponseMessage.BAD_REQUEST;
      case ResponseCode.FORBIDDEN:
        return ResponseMessage.FORBIDDEN;
      case ResponseCode.NOT_FOUND:
        return ResponseMessage.NOT_FOUND;
      case ResponseCode.NO_CONTENT:
        return ResponseMessage.NO_CONTENT;
      case ResponseCode.SUCCESS:
        return ResponseMessage.OK;
      case ResponseCode.UNAUTORISED:
        return ResponseMessage.UNAUTORISED;
      default:
        return '';
    }
  }
}

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
  static String OK = ApiErrors.ok;
}
