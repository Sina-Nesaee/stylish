


import 'package:stylish/feathers/auth/data/datasources/logout/logout_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> logOut() async {
    await remoteDataSource.logOut();
  }
}
