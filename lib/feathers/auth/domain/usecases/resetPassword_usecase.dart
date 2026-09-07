
import 'package:stylish/feathers/auth/domain/repositories/resetpassword_repository.dart';

class ResetpasswordUsecase {
  final ResetpasswordRepository repository;

  ResetpasswordUsecase({required this.repository});
  Future<void> call(String email) async {
    await repository.resetPassword(email);
  }
}
