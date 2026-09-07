
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';

class LoginFacebookUsecase {
  final LoginRepository repository;

  LoginFacebookUsecase({required this.repository});
Future<void> call()async{
  await repository.loginWithFacebook();
}
}