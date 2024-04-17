import 'package:dartz/dartz.dart';
import 'package:emotion/src/features/auth/domain/entities/user.dart';
import 'package:emotion/src/features/auth/domain/usecases/register_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {

  const testUser = User(
    name: 'Test',
    email: 'test@example.com',
    password: 'password',
  );

  test('should return a User object when the user is registered', () async {

    final mockUserRepository = MockUserRepository(); 
    when(mockUserRepository.registerUser(testUser.name, testUser.email, testUser.password))
        .thenAnswer((_) async => Right(testUser));

    RegisterUserUseCase registerUserUseCase = RegisterUserUseCase(mockUserRepository);
    final result = await registerUserUseCase.execute(
      testUser.name,
      testUser.email,
      testUser.password,
    );

    expect(result, const Right(testUser));
    verify(mockUserRepository.registerUser(
      testUser.name,
      testUser.email,
      testUser.password,
    ));
    verifyNoMoreInteractions(mockUserRepository);
  });
}