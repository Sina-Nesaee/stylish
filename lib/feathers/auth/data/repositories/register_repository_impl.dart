
import 'package:stylish/feathers/auth/data/datasources/register/register_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';
import 'package:stylish/feathers/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> register(RegisterEntity registerEntity) async {
    await remoteDataSource.register(registerEntity);
  }
}
