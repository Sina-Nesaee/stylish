
import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register(RegisterEntity registerEntity);
}