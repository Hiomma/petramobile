import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AutoCompleteWidget extends StatelessWidget {
  final dynamic controller;
  final String name;
  final String label;

  AutoCompleteWidget(
      {@required this.controller, @required this.name, @required this.label});

  @override
  Widget build(BuildContext context) {
    return FormBuilderChipsInput(
      name: name,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      chipBuilder: chipBuilder(),
      suggestionBuilder: suggestionBuilder(),
      findSuggestions: findSuggestions(),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(context),
        ],
      ),
    );
  }

  Function chipBuilder() {
    return (context, state, option) => InputChip(
          key: ObjectKey(option),
          label: Text(option.descricao),
          onDeleted: () => state.deleteChip(option),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
  }

  Function suggestionBuilder() {
    return (context, state, option) => ListTile(
          key: ObjectKey(option),
          title: Text(option.descricao),
          // subtitle: Text(empresa.email),
          onTap: () => state.selectSuggestion(option),
        );
  }

  FutureOr<List<dynamic>> Function(String) findSuggestions() {
    return (String query) async {
      await controller.getPessoas(text: query);

      if (query.isNotEmpty) {
        // var lowercaseQuery = query.toLowerCase();
        return [...controller.pessoasList.value];

        // return controller.pessoasList.where((dynamic option) {
        //   return option.descricao.toLowerCase().contains(query.toLowerCase());
        // }).toList(growable: false)
        //   ..sort((dynamic a, dynamic b) => a.descricao
        //       .toLowerCase()
        //       .indexOf(lowercaseQuery)
        //       .compareTo(b.descricao.toLowerCase().indexOf(lowercaseQuery)));
      } else {
        return const <dynamic>[];
      }
    };
  }
}
