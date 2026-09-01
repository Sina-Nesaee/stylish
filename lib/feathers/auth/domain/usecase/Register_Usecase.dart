import 'package:stylish/feathers/auth/domain/Entity/Register_entity.dart';
import 'package:stylish/feathers/auth/domain/repository/Register_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});
  Future<void> call(RegisterEntity registerEntity) async {
    await repository.register(registerEntity);
  }
}
