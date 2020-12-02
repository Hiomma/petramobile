import 'dart:convert' as convert;

import 'package:petramobile/environments.dart';
import 'package:petramobile/repositories/crms0000/crms0000.interface.dart';
import 'package:petramobile/services/storage.service.dart';
import 'package:petramobile/utils.dart';

class Crms0000Repository implements ICrms0000Repository {
  @override
  Future getCrms() async {
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
                  'tabela': 'CRMS0000',
                  'where': '',
                  'orderby': 'CRMS0000.CODIGO',
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
