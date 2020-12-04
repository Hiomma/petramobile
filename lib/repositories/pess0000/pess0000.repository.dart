import 'dart:convert' as convert;

import 'package:petramobile/environments.dart';
import 'package:petramobile/repositories/pess0000/pess0000.interface.dart';
import 'package:petramobile/services/storage.service.dart';
import 'package:petramobile/utils.dart';

class Pess0000Repository implements IPess0000Repository {
  @override
  Future getPessoas(String text) async {
    final token = encodeBase64(await Storage.getStorage('token'));
    var url = '${Environments.api}$token';

    var response = await getDio().post(
      url,
      data: 'values=' +
          Uri.encodeComponent(
            convert.json.encode(
              {
                'type': 'POST',
                'recurso': 'lista',
                'body': {
                  'tabela': 'CLIE0000',
                  'where': "CLIE0000.DESCRICAO LIKE '%${text.toUpperCase()}%'",
                  'orderby': 'CLIE0000.CODIGO',
                  'pagina': 0,
                  'tipodesql': '0',
                  'idsql': []
                }
              },
            ),
          ),
    );

    return response.data;
  }
}
