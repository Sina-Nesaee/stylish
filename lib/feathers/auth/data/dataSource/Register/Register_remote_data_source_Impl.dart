import 'package:stylish/feathers/auth/data/dataSource/Register/Register_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/Entity/Register_entity.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  @override
  Future<void> register(RegisterEntity registerEntity) async {
      await Future.delayed(const Duration(seconds: 1));

    if (registerEntity.email == 'test@test.com') {
      throw Exception('This email is already registered'); 
  } }



}