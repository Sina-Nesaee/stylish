import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/auth/domain/usecases/logout_usecase.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUsecase logoutUsecase;
  LogoutBloc({required this.logoutUsecase}) : super(LogoutInitial()) {
    on<LogoutSubmmitedEvent>(_logOut);
  }
  Future<void> _logOut(
    LogoutSubmmitedEvent event , Emitter<LogoutState> emit
  )async{
    emit(LogoutLoading());
    try{
      await logoutUsecase();
      emit(LogoutSuccess());


    }catch(e){
      emit(LogoutError(message: e.toString()));
    }

  }
}
