import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/crms0000.controller.dart';
import 'package:petramobile/models/crms0000/crms0001.model.dart';
import 'package:petramobile/widgets/drawer/drawer.widget.dart';
import 'package:petramobile/widgets/notification.widget.dart';

class Crms0000CrudPage extends GetView<Crms0000Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'CRM ${controller.selectedCrm.codigo} - ${controller.selectedCrm.posicao == 'F' ? 'Fechado' : 'Aberto'}'),
        centerTitle: true,
        actions: [
          NotificationWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              buildFirstCard(),
              ...controller.selectedCrm.crms0001
                  .map((e) => buildContentCard(e)),
            ],
          )),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: 100,
          child: RaisedButton.icon(
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: Colors.blue,
            onPressed: () => Get.back(),
            label: Text(
              'Voltar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Card buildFirstCard() {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.selectedCrm.nomeDoCliente.capitalize,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        controller.selectedCrm.emailsolicitante.toLowerCase(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: Divider(),
            ),
            Text(
              'Ocorrência:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(controller.selectedCrm.ocorrencia),
          ],
        ),
      ),
    );
  }

  Card buildContentCard(Crms0001 crms0001) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ao Consumidor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'gabrielf2@live.com',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Data: ${crms0001.horainicial} | ${crms0001.horafinal} (${crms0001.tempo})',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 6,
                  child: Chip(
                    backgroundColor: crms0001.kanban == 'D'
                        ? Colors.red[400]
                        : crms0001.kanban == 'T'
                            ? Colors.yellow
                            : Colors.green,
                    label: Text(
                      crms0001.kanban == 'D'
                          ? 'Done'
                          : crms0001.kanban == 'T'
                              ? 'To Do'
                              : 'Wip',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: Divider(),
            ),
            Text(crms0001.parecer),
          ],
        ),
      ),
    );
  }
}
