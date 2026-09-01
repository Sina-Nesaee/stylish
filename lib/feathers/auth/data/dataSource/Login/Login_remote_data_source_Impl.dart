import 'package:stylish/feathers/auth/data/dataSource/Login/Login_remote_data_source.dart';
import 'package:stylish/feathers/auth/domain/Entity/Login_entity.dart';

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
