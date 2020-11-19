import 'dart:convert' as convert;
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:petramobile/environments.dart';
import 'package:petramobile/repositories/login/login.interface.dart';
import 'package:petramobile/services/storage.service.dart';
import 'package:petramobile/utils.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<dynamic> autenticar(String username, String password) async {
    var url = '${Environments.api}';

    var response = await Dio().post(url,
        data: 'values=' +
            Uri.encodeComponent(
              convert.json.encode(
                {
                  'type': 'POST',
                  'recurso': 'autenticar',
                  'body': {
                    'email': username.toUpperCase().trim(),
                    'senha': md5
                        .convert(utf8.encode(password))
                        .toString()
                        .toUpperCase(),
                    'organizacoes': 'S'
                  }
                },
              ),
            ), options: Options(
      validateStatus: (status) {
        if (status != 200) {
          return false;
        } else {
          return true;
        }
      },
    ));
    return response.data;
  }

  @override
  Future<dynamic> login(String codigo, String codigomaster) async {
    final token = encodeBase64(await Storage.getStorage('token'));

    var url = '${Environments.api}$token';

    var response = await Dio().post(url,
        data: 'values=' +
            Uri.encodeComponent(
              convert.json.encode(
                {
                  'type': 'POST',
                  'recurso': 'login',
                  'body': {
                    'codigo': codigo,
                    'codigomaster': codigomaster,
                    'groups': {}
                  }
                },
              ),
            ), options: Options(
      validateStatus: (status) {
        if (status != 200) {
          return false;
        } else {
          return true;
        }
      },
    ));

    return response.data;
  }
}
