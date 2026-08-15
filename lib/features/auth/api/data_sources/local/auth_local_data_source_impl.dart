import 'package:injectable/injectable.dart';
import 'package:testly/config/storage_module/secure_storage_service.dart';
import 'package:testly/features/auth/data/data_sources/local/auth_local_data_source.dart';
@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSourceImpl(this.storage);

  @override
  Future<void> saveToken(String token) {
    return storage.saveToken(token);
  }

  @override
  Future<String?> getToken() {
    return storage.getToken();
  }

  @override
  Future<void> deleteToken() {
    return storage.deleteToken();
  }
}