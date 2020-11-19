import 'package:petramobile/models/noti0000/noti0000.model.dart';

abstract class IMessageRepository {
  Future getMessageSubscription();
  Future setReadingDate(Noti0000 message);
  Future getCompanyAuthentication();
  Future getCompanyByIds(List<int> idsList);
  Future addMessage(Noti0000 message);
}
