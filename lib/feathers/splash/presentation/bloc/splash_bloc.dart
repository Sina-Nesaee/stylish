import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/splash/data/repositories/splash_repository_impl.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepository repository;
  SplashBloc(this.repository) : super(SplashInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      emit(SplashChecking());

      final isLogedIn = await repository.isUserLoggedIn();

      if (isLogedIn) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    });
  }
}
