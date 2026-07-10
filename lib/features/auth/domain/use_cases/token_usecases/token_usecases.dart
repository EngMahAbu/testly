import 'package:testly/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SaveTokenUseCase {
  final AuthRepository repository;

  SaveTokenUseCase(this.repository);

  Future<void> call(String token) {
    return repository.saveToken(token);
  }
}
@injectable
class GetTokenUseCase {
  final AuthRepository repository;

  GetTokenUseCase(this.repository);

  Future<String?> call() {
    return repository.getToken();
  }
}
@injectable
class DeleteTokenUseCase {
  final AuthRepository repository;

  DeleteTokenUseCase(this.repository);

  Future<void> call() {
    return repository.deleteToken();
  }
}