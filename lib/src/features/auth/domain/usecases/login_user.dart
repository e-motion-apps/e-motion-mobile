import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/auth/domain/entities/user.dart';
import 'package:emotion/src/features/auth/domain/repository/user_repository.dart';

class LoginUserUseCase {
  final UserRepository userRepository;

  const LoginUserUseCase(this.userRepository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return userRepository.loginUser(email, password);
  }
}
