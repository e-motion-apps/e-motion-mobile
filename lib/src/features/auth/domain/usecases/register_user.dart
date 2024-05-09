import 'package:dartz/dartz.dart';
import 'package:emotion/src/core/error/failure.dart';
import 'package:emotion/src/features/auth/domain/entities/user.dart';
import 'package:emotion/src/features/auth/domain/repository/user_repository.dart';

class RegisterUserUseCase {
  final UserRepository userRepository;

  const RegisterUserUseCase(this.userRepository);

  Future<Either<Failure, User>> execute(String name, String email, String password) {
    return userRepository.registerUser(name, email, password);
  }
}
