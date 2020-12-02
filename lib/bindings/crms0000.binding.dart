import 'package:get/get.dart';
import 'package:petramobile/controllers/crms0000.controller.dart';
import 'package:petramobile/repositories/crms0000/crms0000.repository.dart';

class Crms0000Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Crms0000Controller>(() {
      return Crms0000Controller(repository: Crms0000Repository());
    });
  }
}
