import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/auth/domain/usecases/resetPassword_usecase.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetpasswordUsecase resetpasswordUsecase;
  ResetPasswordBloc({required this.resetpasswordUsecase})
    : super(ResetPasswordInitial()) {
    on<ResetPasswordSubmittedEvent>(_resetPassword);
  }
  Future<void> _resetPassword(
    ResetPasswordSubmittedEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());
    try {
      await resetpasswordUsecase(event.email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }
}
