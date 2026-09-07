
import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  Future<void> register(RegisterEntity registerEntity);
}