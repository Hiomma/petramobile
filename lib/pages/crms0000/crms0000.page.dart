import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/crms0000/crms0000.controller.dart';
import 'package:petramobile/routes.dart';
import 'package:petramobile/widgets/drawer/drawer.widget.dart';
import 'package:petramobile/widgets/notification/notification.widget.dart';
import 'package:petramobile/widgets/search-bar.widget.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RoutesPath.Crms0000Crud),
        child: Icon(Icons.add),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Container(
              child: SearchBarWidget(
                controller: controller.searchbarController,
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }

  ListView buildList(Crms0000Controller _) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _.crmsList.length,
      itemBuilder: (context, index) {
        final crm = _.crmsList[index];

        return ListTile(
          onTap: () {
            _.selectedCrm = crm;
            Get.toNamed(RoutesPath.Crms0000Visualize);
          },
          title: Text('${crm.codigo.toString()} - ${crm.nomeDoCliente}'),
          subtitle: Text('Data: ${crm.data} - Posição: ${crm.casePosicao}'),
        );
      },
    );
  }
}
