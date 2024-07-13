import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/constant.dart';
import 'package:jobsque/model/cubit/json_models/login.dart';
import 'package:jobsque/model/cubit/json_models/profile.dart';
import 'package:jobsque/model/dio_helper.dart';
import 'json_models/reg.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  Login userLogin = Login();
  UserReg user = UserReg();
  Profile profile = Profile();

  Future<Login?> logIn(
      {required String email, required String password}) async {
    emit(SignInLoading());
    final data = {'email': email, 'password': password};
    final formData = FormData.fromMap(data);
    var dio = Dio();
    await dio
        .post(
          "$baseUrl$loginEndPoint",
          data: formData,
        )
        .then((value) =>
            {userLogin = Login.fromJson(value.data), emit(SignInSuccess())})
        .catchError((error) => {emit(SignInFailure())});
    return null;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegLoading());
    try {
      final response = await DioHelper.postData(
        data: user.toJson(),
        endPoint: regEndpoint,
      );
      user.username = name;
      user.email = email;
      user.password = password;
      if (kDebugMode) {
        print((response.toString()));
      }
      emit(RegSuccess());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegFailure());
    }
  }

  Future<Profile?> getProfile({String? email, String? username}) async {
    emit(GetProfileLoading());
    await DioHelper.getData(
      endPoint: profileEndpoint,
      token: "11484|Xxo5VPB793heudRbtsYk7V2bmFo2qZaH9qf8jXCj",
    )
        .then((value) =>
            {profile = Profile.fromJson(value.data), emit(GetProfileSuccess())})
        .catchError((error) => {emit(GetProfileFailure())});
    return null;
  }
}
