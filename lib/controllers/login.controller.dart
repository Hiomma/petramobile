import 'package:get/get.dart';
import 'package:petramobile/models/organizacoes/organizacoes.model.dart';
import 'package:petramobile/repositories/login/login.interface.dart';
import 'package:petramobile/repositories/login/login.repository.dart';
import 'package:petramobile/services/storage.service.dart';

class LoginController extends GetxController {
  ILoginRepository loginRepository = LoginRepository();

  List<Organizacoes> organizacoesList = [];

  var teste = ''.obs;

  var loading = false.obs;

  void _toggleLoading() => loading.value = !loading.value;

  Future autenticar(Map formulario) async {
    try {
      _toggleLoading();

      final responseLogin = await loginRepository.autenticar(
          formulario['login'], formulario['senha']);

      organizacoesList =
          Organizacoes.fromJsonArray(responseLogin['organizacoes']);

      await Storage.setStorage('token', responseLogin['token']['token']);

      if (responseLogin != null) {
        return responseLogin;
      } else {
        throw (responseLogin);
      }
    } finally {
      _toggleLoading();
    }
  }

  Future login(Organizacoes organizacoes) async {
    try {
      _toggleLoading();

      final responseLogin = await loginRepository.login(
          organizacoes.codigo, organizacoes.codigomaster);

      await Storage.setStorage('empresaLogada', organizacoes);

      if (responseLogin != null) {
        return responseLogin;
      } else {
        throw (responseLogin);
      }
    } finally {
      _toggleLoading();
    }
  }
}
