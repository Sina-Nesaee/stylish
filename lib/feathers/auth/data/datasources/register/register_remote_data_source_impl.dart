import 'package:stylish/feathers/auth/data/datasources/register/register_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  @override
  Future<void> register(RegisterEntity registerEntity) async {
      await Future.delayed(const Duration(seconds: 1));

    if (registerEntity.email == 'test@test.com') {
      throw Exception('This email is already registered'); 
  } }



}