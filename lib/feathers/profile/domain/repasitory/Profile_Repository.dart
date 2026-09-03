import 'package:stylish/feathers/profile/domain/enteties/profile.dart';

abstract class ProfileRepository {
  Future<Profile> get_Proile();
  Future<void> update_Profile(Profile profile);
}