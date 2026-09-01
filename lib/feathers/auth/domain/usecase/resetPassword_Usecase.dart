import 'package:stylish/feathers/auth/domain/repository/ResetPassword_repository.dart';

class ResetpasswordUsecase {
  final ResetpasswordRepository repository;

  ResetpasswordUsecase({required this.repository});
  Future<void> call(String email) async {
    await repository.resetPassword(email);
  }
}
