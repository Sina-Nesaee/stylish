import 'package:stylish/feathers/auth/data/datasources/login/login_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/entities/login_entity.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  @override
  Future<void> login(LoginEntity loginEntity) async {
    if (loginEntity.email == "test@gmail.com" &&
        loginEntity.password == "1234") {
      return;
    }

    throw Exception('email or password is incorrect');
  }

  @override
  Future<void> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
