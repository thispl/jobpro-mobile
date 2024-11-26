import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }
// class CacheManager {
//   final _storage = GetStorage();

//   Future<void> saveToken(Map<String, String> tokenData) async {
//     await _storage.write('tokenData', tokenData);
//   }

//   Map<String, String>? getToken() {
//     return _storage.read<Map<String, String>>('tokenData');
//   }

//   void removeToken() {
//     _storage.remove('tokenData');
//   }
// }