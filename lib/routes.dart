import 'package:get/get.dart';
import 'package:petramobile/bindings/crms0000.binding.dart';
import 'package:petramobile/pages/crms0000/crms0000-crud.dart';
import 'package:petramobile/pages/crms0000/crms0000-visualize.page.dart';
import 'package:petramobile/pages/crms0000/crms0000.page.dart';
import 'package:petramobile/pages/home/home.page.dart';
import 'package:petramobile/pages/login/login.page.dart';
import 'package:petramobile/pages/messages/messages-crud.page.dart';
import 'package:petramobile/pages/messages/messages-info.page.dart';
import 'package:petramobile/pages/messages/messages.page.dart';

part './routes-path.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RoutesPath.Login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RoutesPath.Home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RoutesPath.Messages,
      page: () => MessagesPage(),
    ),
    GetPage(
      name: RoutesPath.MessagesCrud,
      page: () => MessagesCrudPage(),
    ),
    GetPage(
      name: RoutesPath.MessagesInfo,
      page: () => MessagesInfoPage(),
    ),
    GetPage(
      name: RoutesPath.Crms0000,
      page: () => Crms0000Page(),
      binding: Crms0000Binding(),
    ),
    GetPage(
      name: RoutesPath.Crms0000Crud,
      page: () => Crms0000CrudPage(),
    ),
    GetPage(
      name: RoutesPath.Crms0000Visualize,
      page: () => Crms0000VisualizePage(),
    ),
  ];
}
