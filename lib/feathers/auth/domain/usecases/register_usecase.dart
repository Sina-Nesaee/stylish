import 'package:stylish/feathers/auth/domain/entities/register_entity.dart';
import 'package:stylish/feathers/auth/domain/repositories/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});
  Future<void> call(RegisterEntity registerEntity) async {
    await repository.register(registerEntity);
  }
}
