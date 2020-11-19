import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/messages.controller.dart';
import 'package:petramobile/models/noti0000/noti0001.model.dart';
import 'package:petramobile/utils.dart';

class MessagesInfoPage extends StatelessWidget {
  final MessagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações da Mensagem'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.selectedMessage.titulo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(controller.selectedMessage.mensagem),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                            'Enviado em: ${toLocaleDate(controller.selectedMessage.dataEnvio)}'),
                      )
                    ],
                  ),
                ),
              ),
              buildCard(
                  controller.selectedMessage.noti0001
                      .where((element) => element.dataLeitura != null)
                      .toList(),
                  'Visualizados'),
              buildCard(
                  controller.selectedMessage.noti0001
                      .where((element) => element.dataLeitura == null)
                      .toList(),
                  'Não Visualizados'),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCard(List<Noti0001> list, String title) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: 210,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final noti0001 = list[index];

                  final company = controller.companiesByMessageList.firstWhere(
                      (element) => element.codigo == noti0001.empresa);
                  final user = company.auth0001.firstWhere(
                      (element) => element.sequencia == noti0001.usuario);

                  return ListTile(
                    title: Text(user.email),
                    subtitle: Text(
                        "${noti0001.dataLeitura != null ? 'Lido:' + toLocaleDate(noti0001.dataLeitura) : 'Mensagem não Lida'} - Empresa: ${company.codigo}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
