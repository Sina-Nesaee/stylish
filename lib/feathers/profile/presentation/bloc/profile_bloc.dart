import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile_entity.dart';
import 'package:stylish/feathers/profile/domain/usecases/get_profile_usecase.dart';
import 'package:stylish/feathers/profile/domain/usecases/update_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  ProfileBloc({
    required this.getProfileUsecase,
    required this.updateProfileUsecase,
  }) : super(ProfileInitial()) {
    on<GetProfileSubmittedEvent>(_getProfileSubmitted);
    on<UpdateProfileSubmittedEvent>(_updateProfileSubmitted);
  }
  Future<void> _getProfileSubmitted(
    GetProfileSubmittedEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await getProfileUsecase();
      emit(ProfileLoaded(profile: profile));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _updateProfileSubmitted(
    UpdateProfileSubmittedEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(UpdateProfileLoading(profile: event.profile));
    try {
      await updateProfileUsecase(event.profile);
      emit(UpdateProfileLoaded(profile: event.profile));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
