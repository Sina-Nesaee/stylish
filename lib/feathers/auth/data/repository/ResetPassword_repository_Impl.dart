import 'package:stylish/feathers/auth/data/dataSource/ResetPassword/resetPassword_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/repository/ResetPassword_repository.dart';

class ResetpasswordRepositoryImpl implements ResetpasswordRepository{
  final ResetpasswordRemoteDataSource remoteDataSource;

  ResetpasswordRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> resetPassword(String email) async {
    await remoteDataSource.restePassword(email);
  }
}