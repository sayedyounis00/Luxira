import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/core/helper/networking/api_services.dart';
import 'package:luxira/core/utils/constants/strings.dart';
import 'package:luxira/features/auth/register/data/new_user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  late Response response;
  late NewUser user = NewUser(
      email: 'email',
      password: 'password',
      firstname: 'firstname',
      lastname: 'lastname',
      gender: 'gender');
  void register(NewUser newUser) async {
    emit(RegisterLoading());
    try {
      user = newUser;
      Map<String, dynamic> data = {
        'firstName': newUser.firstname,
        'lastName': newUser.lastname,
        'gender': newUser.gender,
        'email': newUser.email,
        'password': newUser.password,
      };
      response = await ApiServices()
          .postMethod(url: ConstString.registerUrl, data: data);
      emit(RegisterSuccess(newUser: newUser));
    } catch (e) {
      return log("error message:${e.toString()}:statuscode:${response.statusCode}");
    }
  }
}
