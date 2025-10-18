abstract class LocalStorageService {
  Future<void> write(String key, dynamic value);
  T? read<T>(String key);
}