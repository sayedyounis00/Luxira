import 'package:luxira/core/helper/networking/api_constants.dart';
import 'package:luxira/core/helper/networking/api_services.dart';

class ResetPassword {
  sentNewCodeToResetPAssword(String email) {
    ApiServices().postMethod(
        data: {'email': email}, url: ApiConstants.sendNewCodetoResetPAss);

  }
}
