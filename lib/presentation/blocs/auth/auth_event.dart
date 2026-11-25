import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String phoneNumber;

  const LoginRequested(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class LogoutRequested extends AuthEvent {}

class RegisterRequested extends AuthEvent {
  final String phoneNumber;
  final String? name;

  const RegisterRequested(this.phoneNumber, {this.name});

  @override
  List<Object?> get props => [phoneNumber, name];
}

class AuthCheckRequested extends AuthEvent {}
