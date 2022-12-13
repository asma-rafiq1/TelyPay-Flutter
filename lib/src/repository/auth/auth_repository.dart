abstract class AuthRepository {
  Future<dynamic> loginApi(String url, Map<String, dynamic> payloadObj);
}
