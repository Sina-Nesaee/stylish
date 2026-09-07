import 'package:stylish/feathers/profile/domain/enteties/profile_entity.dart';
import 'package:stylish/feathers/profile/domain/repasitories/profile_repository.dart';

class UpdateProfileUsecase {
  final ProfileRepository repository;

  UpdateProfileUsecase({required this.repository});
  Future<void> call(Profile profile) async {
    await repository.update_Profile(profile);
  }
}
