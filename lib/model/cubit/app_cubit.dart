import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/constant.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  GlobalKey globalKey = GlobalKey();
  var currentIndex = 0;
  bottomNavBar(int index) {
    emit(BottomNavBarStates());
    currentIndex = index;
  }

  logIn() async {
    try {
      emit(SignInLoading());
      final response = await Dio().post(baseUrl, data: {
        "email": email.text,
        "password": password.text,
      });
      emit(SignInSuccess());
    } catch (error) {
      emit(SignInFailure());
      print(error.toString());
    }
  }
}
