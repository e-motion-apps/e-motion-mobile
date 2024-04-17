import 'package:dartz/dartz.dart';
import 'package:emotion/src/features/auth/domain/entities/user.dart';
import 'package:emotion/src/core/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> registerUser(String name, String email, String password);
  Future<Either<Failure, User>> loginUser(String email, String password);
  Future<Either<Failure, User>> logoutUser();
}