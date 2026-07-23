import 'package:testly/config/storage_module/secure_storage_service.dart';

class TokenService {
  final SecureStorageService _storage;

  String? _inMemoryToken;

  TokenService(this._storage);

  Future<String?> getToken() async {
    if (_inMemoryToken != null) return _inMemoryToken;
    return await _storage.getToken();
  }

  void setToken(String token, {bool persist = false}) {
    _inMemoryToken = token;
    if (persist) {
      _storage.saveToken(token);
    }
  }

  Future<void> clear() async {
    _inMemoryToken = null;
    await _storage.deleteToken();
  }
}
