import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/auth/domain/Entity/Login_entity.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Apple_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Facebook_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Google_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginAppleUsecase loginAppleUsecase;
  final LoginGoogleUsecase loginGoogleUsecase;
  final LoginFacebookUsecase loginFacebookUsecase;
  final LoginUsecase loginUsecase;
  LoginBloc({
    required this.loginUsecase,
    required this.loginAppleUsecase,
    required this.loginGoogleUsecase,
    required this.loginFacebookUsecase,
  }) : super(LoginInitial()) {
    on<LoginSubmitted>(_login);
    on<LoginWithAppleSubmittedEvent>(_loginWithApple);
    on<LoginWithGoogleSubmittedEvent>(_loginWithGoogle);
    on<LoginWithFacebookSubmittedEvent>(_loginWithFacebook);
  }
  Future<void> _login(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final login = LoginEntity(email: event.email, password: event.password);
      await loginUsecase(login);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  Future<void> _loginWithApple(
    LoginWithAppleSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    return _executeLogin(loginAppleUsecase, emit);
  }

  Future<void> _loginWithGoogle(
    LoginWithGoogleSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    return _executeLogin(loginGoogleUsecase, emit);
  }

  Future<void> _loginWithFacebook(
    LoginWithFacebookSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    return _executeLogin(loginFacebookUsecase, emit);
  }

  Future<void> _executeLogin(
    Future<void> Function() action,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await action();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
