part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetProfileSubmittedEvent extends ProfileEvent {}

class UpdateProfileSubmittedEvent extends ProfileEvent {
  final Profile profile;

  UpdateProfileSubmittedEvent({required this.profile});
}
