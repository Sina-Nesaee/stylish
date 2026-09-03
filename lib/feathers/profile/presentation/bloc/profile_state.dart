part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState{}
final class ProfileLoaded extends ProfileState{
  final Profile profile;

  ProfileLoaded({required this.profile});

}
final class UpdateProfileLoading extends ProfileState{
   final Profile profile;

  UpdateProfileLoading({required this.profile});
}
final class UpdateProfileLoaded extends ProfileState{
   final Profile profile;

  UpdateProfileLoaded({required this.profile});
  
}
final class ProfileError extends ProfileState{
  final String message;

  ProfileError({required this.message});
}