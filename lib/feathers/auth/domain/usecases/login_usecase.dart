import 'package:stylish/feathers/auth/domain/entities/login_entity.dart';
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});
  Future<void> call(LoginEntity  loginEntity)async {
   await repository.login(loginEntity);
  }

}