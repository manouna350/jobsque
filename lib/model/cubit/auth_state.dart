part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInLoading extends AuthState {}

class SignInFailure extends AuthState {}

class RegSuccess extends AuthState {}

class RegLoading extends AuthState {}

class RegFailure extends AuthState {}

class GetProfileSuccess extends AuthState {}

class GetProfileLoading extends AuthState {}

class GetProfileFailure extends AuthState {}
