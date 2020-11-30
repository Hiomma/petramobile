import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/messages.controller.dart';
import 'package:petramobile/models/noti0000/noti0000.model.dart';
import 'package:petramobile/routes.dart';
import 'package:petramobile/services/snackbar.service.dart';
import 'package:petramobile/services/storage.service.dart';
import 'package:petramobile/utils.dart';

class MessagesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  final MessagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<MessagesController>(
      builder: (controller) {
        return Scaffold(
          key: scaffoldState,
          appBar: AppBar(
            title: Text('Mensagens'),
            centerTitle: true,
          ),
          body: Builder(
            builder: (context) => Container(
              child: ListView.builder(
                itemCount: controller.messagesList.length,
                itemBuilder: (context, index) {
                  final message = controller.messagesList[index];

                  return ListTile(
                    onTap: () => openModal(controller, message),
                    title: Text(message.titulo),
                    subtitle: Text(
                        "Enviado: ${toLocaleDate(message.dataEnvio).split(" ")[0]}${message.noti0001[0].dataLeitura != null ? ' | Lido:' + toLocaleDate(message.noti0001[0].dataLeitura).split(" ")[0] : ''} "),
                    trailing: message.noti0001[0].dataLeitura != null
                        ? Icon(
                            Icons.done_all,
                            color: Colors.blue,
                          )
                        : null,
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: !controller.loading.value
                ? Icon(Icons.add)
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
            onPressed: () => openCrud(controller),
          ),
        );
      },
    );
  }

  void openModal(MessagesController controller, Noti0000 message) async {
    final empresaLogada = await Storage.getStorage('empresaLogada');

    if (['1', '2', '3'].contains(empresaLogada['codigomaster'])) {
      await controller.getCompanyByMessage(message);

      controller.selectedMessage = message;

      await Get.toNamed(RoutesPath.MessagesInfo);
    } else {
      if (message.noti0001.isNotEmpty &&
          message.noti0001[0].dataLeitura == null) {
        controller.setReadingDate(message);
      }

      Widget okButton = FlatButton(
        child: Text('OK'),
        onPressed: () {
          Get.back();
        },
      );

      var alerta = AlertDialog(
        title: Text(message.titulo),
        content: Text(message.mensagem),
        actions: [
          okButton,
        ],
      );

      await Get.dialog(alerta);
    }
  }

  void openCrud(MessagesController controller) async {
    await controller.getCompanyAuthentication();

    final response = await Get.toNamed(RoutesPath.MessagesCrud);

    if (response != null) {
      Get.find<SnackbarService>()
          .success('Atenção', 'Mensagens enviadas com sucesso! ');
    }
  }
}
