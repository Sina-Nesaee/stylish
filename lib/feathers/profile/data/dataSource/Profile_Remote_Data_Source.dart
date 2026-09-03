import 'package:stylish/feathers/profile/data/model/profile_Model.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> get_Profile();
  Future<void> update_Profile(Profile profile);
}