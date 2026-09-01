import 'package:stylish/feathers/auth/data/dataSource/Logout/Logout_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/repository/Logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> logOut() async {
    await remoteDataSource.logOut();
  }
}
