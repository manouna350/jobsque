part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInLoading extends AuthState {}

class SignInFailure extends AuthState {}
