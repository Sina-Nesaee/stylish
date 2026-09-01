import 'package:stylish/feathers/auth/domain/Entity/Register_entity.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterEntity registerEntity);
}