part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}
class LoginWithAppleSubmittedEvent extends LoginEvent{}
class LoginWithFacebookSubmittedEvent extends LoginEvent{}
class LoginWithGoogleSubmittedEvent extends LoginEvent{}
