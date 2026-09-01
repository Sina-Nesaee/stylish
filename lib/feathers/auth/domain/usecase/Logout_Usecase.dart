import 'package:stylish/feathers/auth/domain/repository/Logout_repository.dart';

class LogoutUsecase {
  final LogoutRepository repository;
  LogoutUsecase({required this.repository});
  Future<void> call() async {
    await repository.logOut();
  }
}
