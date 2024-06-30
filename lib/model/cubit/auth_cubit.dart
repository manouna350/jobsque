import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/constant.dart';
import 'package:jobsque/model/cubit/json_models/login.dart';
import '../dio_helper.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  Login userLogin = Login();

  Future<Login?> logIn(
      {required String email, required String password}) async {
    emit(SignInLoading());
    final response = await DioHelper.postData(
      endPoint: loginEndPoint,
      data: {
        "email": email,
        "password": password,
      },
    )
        .then((value) =>
            {userLogin = Login.fromJson(value.data), emit(SignInSuccess())})
        .catchError(
            (error) => {print(error.toString()), emit(SignInFailure())});
  }
}
