
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';

class LoginGoogleUsecase {
  final LoginRepository repository;

  LoginGoogleUsecase({required this.repository});

  
Future<void> call()async{
  await repository.loginWithGoogle();
}
}