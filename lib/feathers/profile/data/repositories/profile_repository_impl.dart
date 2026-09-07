

import 'package:stylish/feathers/profile/data/datasources/profile_remote_data_source.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile_entity.dart';
import 'package:stylish/feathers/profile/domain/repasitories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Profile> get_Proile() async{
    return await remoteDataSource.get_Profile();
  }

  @override
  Future<void> update_Profile(Profile profile) async{
    await remoteDataSource.update_Profile(profile);
  }
}