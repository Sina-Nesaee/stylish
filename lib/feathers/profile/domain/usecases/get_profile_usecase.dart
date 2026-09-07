import 'package:stylish/feathers/profile/domain/enteties/profile_entity.dart';
import 'package:stylish/feathers/profile/domain/repasitories/profile_repository.dart';

class GetProfileUsecase {
  final ProfileRepository repository;

  GetProfileUsecase({required this.repository});
  Future<Profile> call()async{
    return await repository.get_Proile();
  }
}