import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/crms0000.controller.dart';
import 'package:petramobile/routes.dart';
import 'package:petramobile/widgets/drawer/drawer.widget.dart';
import 'package:petramobile/widgets/notification.widget.dart';

class Crms0000Page extends GetView<Crms0000Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRM'),
        centerTitle: true,
        actions: [
          NotificationWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) => Container(
          child: GetX<Crms0000Controller>(
            initState: (_) {
              Get.find<Crms0000Controller>().getCrms();
            },
            builder: (_) {
              return _.crmsList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : buildList(_);
            },
          ),
        ),
      ),
    );
  }

  ListView buildList(Crms0000Controller _) {
    return ListView.builder(
      itemCount: _.crmsList.length,
      itemBuilder: (context, index) {
        final crm = _.crmsList[index];

        return ListTile(
          onTap: () {
            _.selectedCrm = crm;
            Get.toNamed(RoutesPath.Crms0000Crud);
          },
          title: Text('${crm.codigo.toString()} - ${crm.nomeDoCliente}'),
          subtitle: Text('Data: ${crm.data} - Posição: ${crm.casePosicao}'),
        );
      },
    );
  }
}
