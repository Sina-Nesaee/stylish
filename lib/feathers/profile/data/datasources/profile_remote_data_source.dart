
import 'package:stylish/feathers/profile/data/models/profile_model.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> get_Profile();
  Future<void> update_Profile(Profile profile);
}