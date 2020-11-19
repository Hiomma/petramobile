abstract class ILoginRepository {
  Future<dynamic> autenticar(String username, String password);
  Future<dynamic> login(String codigo, String codigomaster);
}
