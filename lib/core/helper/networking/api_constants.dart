class ApiConstants {
  static const String basseUrl =
      'https://e-commerce-production-2d41.up.railway.app';
  static const String register = '$basseUrl/api/auth/register';
  static const String login = "$basseUrl/api/auth//login";
  static const String resendVerifyCodeUrl = "$basseUrl/api/auth/new-code";
  static const String confirmAccount = "$basseUrl/api/auth/verify";
  static const String sendNewCodetoResetPAss = "$basseUrl/api/auth/new-code";
  static const String regiserUsingGoogle = "$basseUrl/auth/google/register";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
