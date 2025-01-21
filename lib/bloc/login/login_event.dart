import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSumbitted extends LoginEvent {
  final String username;
  final String password;
  LoginSumbitted({
    required this.password,
    required this.username,
  });
  @override
  List<Object?> get props => [username, password];
}
