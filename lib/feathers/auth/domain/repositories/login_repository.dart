
import 'package:stylish/feathers/auth/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<void> login(LoginEntity loginEntity);
  Future<void> loginWithApple();
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
}