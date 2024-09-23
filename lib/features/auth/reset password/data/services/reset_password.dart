import 'package:luxira/core/helper/networking/api_services.dart';
import 'package:luxira/core/utils/constants/strings.dart';

class ResetPassword {
  sentNewCodeToResetPAssword(String email) {
    ApiServices().postMethod(
        data: {'email': email}, url: ConstString.sendNewCodetoResetPAss);

  }
}
