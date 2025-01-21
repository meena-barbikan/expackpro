import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitlalize extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});
}
