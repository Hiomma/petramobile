import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/models/crms0000/crms0000.model.dart';
import 'package:petramobile/repositories/crms0000/crms0000.interface.dart';

class Crms0000Controller extends GetxController {
  final ICrms0000Repository repository;

  Crms0000Controller({@required this.repository}) : assert(repository != null);

  final crmsList = <Crms0000>[].obs;

  Crms0000 selectedCrm;

  var loading = false.obs;

  void _toggleLoading() => loading.value = !loading.value;

  void getCrms() async {
    _toggleLoading();

    var crms = await repository.getCrms();

    crmsList.value = crms
        .map((element) => Crms0000.fromJson(element))
        .cast<Crms0000>()
        .toList();

    _toggleLoading();
  }
}
