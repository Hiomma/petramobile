import 'package:get/get.dart';
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
  ];
}
