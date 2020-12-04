import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petramobile/controllers/messages/messages.controller.dart';
import 'package:petramobile/models/auth0000/auth0000.model.dart';

class MessagesCrudPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final MessagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incluir Mensagem'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => FormBuilder(
          key: _fbKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: FormBuilderTextField(
                        name: 'titulo',
                        decoration: InputDecoration(
                          labelText: 'Título',
                          border: OutlineInputBorder(),
                        ),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 5)
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: FormBuilderTextField(
                      name: 'mensagem',
                      decoration: InputDecoration(
                        labelText: 'Mensagem',
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
                    child: FormBuilderDateTimePicker(
                      name: 'data_programada',
                      inputType: InputType.both,
                      format: DateFormat('dd/MM/yyyy hh:mm'),
                      decoration: InputDecoration(
                        labelText: 'Data Programada',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: FormBuilderChipsInput(
                      name: 'empresas',
                      decoration: InputDecoration(
                        labelText: 'Empresas',
                        border: OutlineInputBorder(),
                      ),
                      chipBuilder: chipBuilder(),
                      suggestionBuilder: suggestionBuilder(),
                      findSuggestions: findSuggestions(controller),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text('Cancelar'),
                          onPressed: () => cancel(),
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () => confirm(controller),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void confirm(MessagesController controller) async {
    if (_fbKey.currentState.saveAndValidate()) {
      await controller.addMessage(_fbKey.currentState.value);
      Get.back(result: _fbKey.currentState.value);
    }
  }

  void cancel() {
    Get.back();
  }

  Function chipBuilder() {
    return (context, state, empresa) => InputChip(
          key: ObjectKey(empresa),
          label: Text(empresa.empresa),
          onDeleted: () => state.deleteChip(empresa),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
  }

  Function suggestionBuilder() {
    return (context, state, empresa) => ListTile(
          key: ObjectKey(empresa),
          title: Text(empresa.empresa),
          // subtitle: Text(empresa.email),
          onTap: () => state.selectSuggestion(empresa),
        );
  }

  List<Auth0000> Function(String query) findSuggestions(
      MessagesController controller) {
    return (String query) {
      if (query.isNotEmpty) {
        var lowercaseQuery = query.toLowerCase();
        return controller.companiesList.where((company) {
          return company.empresa.toLowerCase().contains(query.toLowerCase());
        }).toList(growable: false)
          ..sort((a, b) => a.empresa
              .toLowerCase()
              .indexOf(lowercaseQuery)
              .compareTo(b.empresa.toLowerCase().indexOf(lowercaseQuery)));
      } else {
        return const <Auth0000>[];
      }
    };
  }
}
