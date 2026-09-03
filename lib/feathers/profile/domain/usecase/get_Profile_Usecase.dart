import 'package:stylish/feathers/profile/domain/enteties/profile.dart';
import 'package:stylish/feathers/profile/domain/repasitory/Profile_Repository.dart';

class GetProfileUsecase {
  final ProfileRepository repository;

  GetProfileUsecase({required this.repository});
  Future<Profile> call()async{
    return await repository.get_Proile();
  }
}