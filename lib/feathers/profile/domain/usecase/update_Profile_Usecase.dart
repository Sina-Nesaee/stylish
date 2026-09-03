import 'package:stylish/feathers/profile/domain/enteties/profile.dart';
import 'package:stylish/feathers/profile/domain/repasitory/Profile_Repository.dart';

class UpdateProfileUsecase {
  final ProfileRepository repository;

  UpdateProfileUsecase({required this.repository});
  Future<void> call(Profile profile) async {
    await repository.update_Profile(profile);
  }
}
