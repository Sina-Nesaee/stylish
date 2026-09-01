import 'package:stylish/feathers/auth/domain/Entity/Register_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register(RegisterEntity registerEntity);
}