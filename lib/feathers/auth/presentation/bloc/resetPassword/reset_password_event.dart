part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}
class ResetPasswordSubmittedEvent extends ResetPasswordEvent{
  final String email;

  ResetPasswordSubmittedEvent({required this.email});
}