part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashChecking extends SplashState{}
final class SplashAuthenticated extends SplashState{}
final class SplashUnauthenticated extends SplashState{}
