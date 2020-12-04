import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/models/pess0000/pess0000.model.dart';
import 'package:petramobile/repositories/pess0000/pess0000.interface.dart';

class Pess0000Controller extends GetxController {
  final IPess0000Repository repository;

  var pessoasList = <Pess0000>[].obs;

  var loading = false.obs;

  Pess0000Controller({@required this.repository}) : assert(repository != null);

  void _toggleLoading() => loading.value = !loading.value;

  void getPessoas({String text = ''}) async {
    _toggleLoading();

    var pessoas = await repository.getPessoas(text);

    pessoasList.clear();

    pessoasList.addAll(pessoas
        .map((element) => Pess0000.fromJson(element))
        .cast<Pess0000>()
        .toList());

    _toggleLoading();
  }
}
