import 'package:emotion/src/features/auth/domain/repository/user_repository.dart';

class LogoutUserUseCase {
  final UserRepository userRepository;

  LogoutUserUseCase(this.userRepository);

  Future<void> call() async {
    await userRepository.logoutUser();
}
}
