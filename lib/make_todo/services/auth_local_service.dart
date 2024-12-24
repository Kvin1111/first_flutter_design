import 'package:get_storage/get_storage.dart';

class AuthLocalService {
  final box = GetStorage();
  Future<void> saveToken(String token) async {
    // Save token to local storage
    await box.write('token', token);

  }

  Future<String?> getToken() async {
    // Get token from local storage
    return box.read('token');
  }
  Future<void> removeToken() async {
    // Remove token from local storage
    await box.remove('token');
  }

}