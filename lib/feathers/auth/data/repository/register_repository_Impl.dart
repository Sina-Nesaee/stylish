import 'package:stylish/feathers/auth/data/dataSource/Register/Register_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/Entity/Register_entity.dart';
import 'package:stylish/feathers/auth/domain/repository/Register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> register(RegisterEntity registerEntity) async {
    await remoteDataSource.register(registerEntity);
  }
}
