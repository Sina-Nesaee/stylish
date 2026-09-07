import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';
import 'package:stylish/feathers/auth/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc({required this.registerUsecase}) : super(RegisterInitial()) {
    on<RegisterSubmitted>(register);
  }
  Future<void> register(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final register = RegisterEntity(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      await registerUsecase(register);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
