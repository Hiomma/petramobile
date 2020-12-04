import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:petramobile/models/auth0000/auth0000.model.dart';
import 'package:petramobile/models/noti0000/noti0000.model.dart';
import 'package:petramobile/repositories/message/messages.interface.dart';
import 'package:petramobile/repositories/message/messages.repository.dart';
import 'package:petramobile/services/storage.service.dart';

class MessagesController extends GetxController {
  IMessageRepository messageRepository = MessageRepository();

  List<Auth0000> companiesList = [];
  List<Auth0000> companiesByMessageList = [];
  List<Noti0000> messagesList = [];

  Noti0000 selectedMessage;

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initMessageSubscription();
  }

  void _toggleLoading() => loading.value = !loading.value;

  void initMessageSubscription() async {
    Snapshot snapshot = await messageRepository.getMessageSubscription();

    snapshot.listen((messages) {
      messagesList = messages['data']['noti0000']
          .map((element) => Noti0000.fromJson(element))
          .cast<Noti0000>()
          .toList();
    });
  }

  void setReadingDate(Noti0000 message) async {
    final empresaLogada = await Storage.getStorage('empresaLogada');

    if (!['1', '2', '3'].contains(empresaLogada['codigomaster'])) {
      await messageRepository.setReadingDate(message);
    }
  }

  void getCompanyAuthentication() async {
    _toggleLoading();

    final companies = await messageRepository.getCompanyAuthentication();

    companiesList = companies
        .map((element) => Auth0000.fromJson(element))
        .cast<Auth0000>()
        .toList();

    _toggleLoading();
  }

  void getCompanyByMessage(Noti0000 message) async {
    final idList = <int>[];
    message.noti0001.forEach((element) =>
        !idList.contains(element.empresa) ? idList.add(element.empresa) : null);

    _toggleLoading();

    final companies = await messageRepository.getCompanyByIds(idList);

    companiesByMessageList = companies
        .map((element) => Auth0000.fromJson(element))
        .cast<Auth0000>()
        .toList();

    _toggleLoading();
  }

  void addMessage(Map<String, dynamic> message) async {
    var messageModel =
        Noti0000.fromDwJson(message, message['empresas'].cast<Auth0000>());
    await messageRepository.addMessage(messageModel);
  }
}
