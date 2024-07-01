import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/constant.dart';
import 'package:jobsque/model/cubit/json_models/login.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  Login userLogin = Login();

  Future<Login?> logIn(
      {required String email, required String password}) async {
    emit(SignInLoading());
    final data = {'email': email, 'password': password};
    final formData = FormData.fromMap(data);
    var dio = Dio();
    var response = await dio
        .post(
          "$baseUrl$loginEndPoint",
          data: formData,
        )
        .then((value) =>
            {userLogin = Login.fromJson(value.data), emit(SignInSuccess())})
        .catchError(
            (error) => {print(error.toString()), emit(SignInFailure())});
  }
}
