
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';

class LoginAppleUsecase {
  final LoginRepository repository;

  LoginAppleUsecase({required this.repository});
Future<void> call()async{
  await repository.loginWithApple();
}
}