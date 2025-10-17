import 'package:get_storage/get_storage.dart';
import 'package:cat_lover_app/core/local_storage/domain/local_storage_service.dart';
  
class GetLocalStorageServiceImpl implements LocalStorageService {
  final GetStorage _storage = GetStorage();

  @override
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  @override
  T? read<T>(String key) {
    return _storage.read<T>(key);
  }
}
