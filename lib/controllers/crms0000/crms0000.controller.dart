import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/models/crms0000/crms0000.model.dart';
import 'package:petramobile/repositories/crms0000/crms0000.interface.dart';
import 'package:petramobile/utils/debounce.dart';

class Crms0000Controller extends GetxController {
  final ICrms0000Repository repository;

  var crmsList = <Crms0000>[].obs;

  final searchbarController = TextEditingController();

  Crms0000 selectedCrm;

  var loading = false.obs;

  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  Crms0000Controller({@required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    super.onInit();

    searchbarController.addListener(() {
      _debouncer.run(() => getCrms(text: searchbarController.text));
    });
  }

  void _toggleLoading() => loading.value = !loading.value;

  void getCrms({String text = ''}) async {
    _toggleLoading();

    var crms = await repository.getCrms(text);

    crmsList.clear();

    crmsList.addAll(crms
        .map((element) => Crms0000.fromJson(element))
        .cast<Crms0000>()
        .toList());

    _toggleLoading();
  }
}
