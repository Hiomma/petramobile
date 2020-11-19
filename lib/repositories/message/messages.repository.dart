import 'dart:convert' as convert;

import 'package:hasura_connect/hasura_connect.dart';
import 'package:petramobile/environments.dart';
import 'package:petramobile/models/noti0000/noti0000.model.dart';
import 'package:petramobile/repositories/message/messages.interface.dart';
import 'package:petramobile/services/storage.service.dart';
import 'package:petramobile/utils.dart';

class MessageRepository implements IMessageRepository {
  HasuraConnect hasuraConnect = HasuraConnect(Environments.hasura);

  @override
  Future<Snapshot> getMessageSubscription() async {
    final empresaLogada = await Storage.getStorage('empresaLogada');

    final query = '''
       subscription MySubscription(\$empresa: Int, \$usuario: Int, \$dateNow: date) {
                noti0000(where: {data_programada: {_lte: \$dateNow}, noti0001: {empresa: {_eq: \$empresa}, usuario: {_eq: \$usuario}}}, order_by: {data_envio: desc}) {
                    data_envio
                    data_programada
                    id
                    mensagem
                    titulo
                    noti0001(where: {empresa: {_eq: \$empresa}, usuario: {_eq: \$usuario}}){
                        data_leitura
                        empresa
                        usuario
                    }
                }
              }
      ''';

    if (!['1', '2', '3'].contains(empresaLogada['codigomaster'])) {
      return hasuraConnect.subscription(query, variables: {
        'empresa': empresaLogada['codigomaster'],
        'usuario': empresaLogada['codigo'],
        'dateNow': toStringDate(DateTime.now(), 'yyyy-MM-dd')
      });
    } else {
      return hasuraConnect.subscription(query);
    }
  }

  @override
  Future<Future> setReadingDate(Noti0000 message) async {
    final empresaLogada = await Storage.getStorage('empresaLogada');

    final query = '''
                  mutation MyMutation {
                    update_noti0001(where: {notificacao: {_eq: \$notificacao}, empresa: {_eq: \$empresa}, usuario: {_eq: \$usuario}}, _set: {data_leitura: "${DateTime.now().toIso8601String()}"}) {
                      returning {
                        usuario
                        notificacao
                        id
                        data_leitura
                        empresa
                      }
                    }
                  }
      ''';

    return hasuraConnect.mutation(query, variables: {
      'notificacao': message.id,
      'empresa': empresaLogada['codigomaster'],
      'usuario': empresaLogada['usuario'],
    });
  }

  @override
  Future getCompanyAuthentication() async {
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
                  'tabela': 'AUTH0000',
                  'where': '',
                  'orderby': 'AUTH0000.CODIGO',
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

  @override
  Future getCompanyByIds(List<int> idsList) async {
    final token = encodeBase64(await Storage.getStorage('token'));
    var url = '${Environments.api}$token';

    var where = idsList.map((e) => "'" + e.toString() + "'").join(',');

    var response = await getDio().post(
      url,
      data: 'values=' +
          Uri.encodeComponent(
            convert.json.encode(
              {
                'type': 'POST',
                'recurso': 'lista',
                'body': {
                  'tabela': 'AUTH0000',
                  'where': 'AUTH0000.CODIGO IN ($where)',
                  'orderby': 'AUTH0000.CODIGO',
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

  @override
  Future addMessage(Noti0000 message) {
    final query = '''
            mutation MyMutation(\$mensagem: String, \$titulo: String, \$dataProgramada: date,\$noti0001: [noti0001_insert_input!]!) {
              insert_noti0000(objects: {mensagem: \$mensagem, titulo: \$titulo, data_programada: \$dataProgramada,noti0001: {data: \$noti0001}}) {
                returning {
                  id
                }
              }
            }
      ''';

    return hasuraConnect.mutation(query, variables: {
      'mensagem': message.mensagem,
      'titulo': message.titulo,
      'dataProgramada': message.dataProgramada == null
          ? DateTime.now().toIso8601String()
          : message.dataProgramada.toIso8601String(),
      'noti0001': message.noti0001
    });
  }
}
