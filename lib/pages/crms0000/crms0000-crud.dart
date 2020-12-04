import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petramobile/controllers/crms0000/crms0000.controller.dart';
import 'package:petramobile/controllers/pess0000/pess0000.controller.dart';
import 'package:petramobile/repositories/pess0000/pess0000.repository.dart';
import 'package:petramobile/widgets/auto-complete/auto-complete.dart';
import 'package:petramobile/widgets/drawer/drawer.widget.dart';
import 'package:petramobile/widgets/notification/notification.widget.dart';

class Crms0000CrudPage extends GetView<Crms0000Controller> {
  final pessController =
      Get.put(Pess0000Controller(repository: Pess0000Repository()));

  final _key = GlobalKey<FormBuilderState>();
  final kanbanOptions = [
    {'value': 'T', 'text': 'To do'},
    {'value': 'W', 'text': 'WIP'},
    {'value': 'D', 'text': 'Done'},
  ]
      .map((options) => DropdownMenuItem(
            value: options['value'],
            child: Text('${options['text']}'),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRM - Adicionar'),
        centerTitle: true,
        actions: [
          NotificationWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: FormBuilder(
              key: _key,
              child: Column(
                children: buildFields(context),
              ),
            ),
          ),
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

  List<Padding> buildFields(context) {
    return [
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: AutoCompleteWidget(
            label: 'Cliente',
            name: 'cliente',
            controller: pessController,
          )),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FormBuilderTextField(
          name: 'ocorrencia',
          decoration: InputDecoration(
            labelText: 'Ocorrência',
            border: OutlineInputBorder(),
          ),
          minLines: 5,
          maxLines: 5,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 5)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FormBuilderTextField(
          name: 'parecer',
          decoration: InputDecoration(
            labelText: 'Parecer',
            border: OutlineInputBorder(),
          ),
          minLines: 5,
          maxLines: 5,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 5)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FormBuilderDropdown(
          name: 'kanban',
          decoration: InputDecoration(
            labelText: 'Tarefa',
            border: OutlineInputBorder(),
          ),
          // initialValue: 'Male',
          allowClear: true,
          hint: Text('Selecione uma Tarefa'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: kanbanOptions,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FormBuilderDateTimePicker(
          name: 'horainicial',
          inputType: InputType.time,
          format: DateFormat('hh:mm'),
          decoration: InputDecoration(
            labelText: 'Hora Inicial',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FormBuilderDateTimePicker(
          name: 'horafinal',
          inputType: InputType.time,
          format: DateFormat('hh:mm'),
          decoration: InputDecoration(
            labelText: 'Hora Final',
            border: OutlineInputBorder(),
          ),
        ),
      )
    ];
  }
}
