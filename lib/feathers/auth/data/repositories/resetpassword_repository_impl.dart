

import 'package:stylish/feathers/auth/data/datasources/resetpassword/resetPassword_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/repositories/resetpassword_repository.dart';

class ResetpasswordRepositoryImpl implements ResetpasswordRepository{
  final ResetpasswordRemoteDataSource remoteDataSource;

  ResetpasswordRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> resetPassword(String email) async {
    await remoteDataSource.restePassword(email);
  }
}