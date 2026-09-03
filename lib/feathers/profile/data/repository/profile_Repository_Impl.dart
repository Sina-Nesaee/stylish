import 'package:stylish/feathers/profile/data/dataSource/Profile_Remote_Data_Source.dart';
import 'package:stylish/feathers/profile/domain/enteties/profile.dart';
import 'package:stylish/feathers/profile/domain/repasitory/Profile_Repository.dart';

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