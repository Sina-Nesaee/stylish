import 'package:stylish/feathers/auth/domain/Entity/Login_entity.dart';
import 'package:stylish/feathers/auth/domain/repository/Login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});
  Future<void> call(LoginEntity  loginEntity)async {
   await repository.login(loginEntity);
  }

}