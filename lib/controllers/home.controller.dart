import 'package:get/get.dart';
import 'package:petramobile/repositories/home/home.interface.dart';
import 'package:petramobile/repositories/home/home.repository.dart';

class HomeController extends GetxController {
  IHomeRepository loginRepository = HomeRepository();

  var loading = false.obs;

  // void _toggleLoading() => loading.value = !loading.value;
  
}
