import 'package:stylish/feathers/auth/data/datasources/login/login_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/entities/login_entity.dart';
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> login(LoginEntity loginEntity) async {
    await remoteDataSource.login(loginEntity);
  }

  @override
  Future<void> loginWithApple() async {
    await remoteDataSource.loginWithApple();
  }

  @override
  Future<void> loginWithFacebook() async {
    await remoteDataSource.loginWithFacebook();
  }

  @override
  Future<void> loginWithGoogle() async {
    await remoteDataSource.loginWithGoogle();
  }
}
