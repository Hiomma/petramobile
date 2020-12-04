import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openMessagesPage(),
      child: Container(
        margin: EdgeInsets.only(top: 8, right: 8),
        child: Stack(children: [
          Icon(
            Icons.notifications,
            size: 35,
          ),
          lengthMessage() > 0
              ? Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                    child: Text(
                      lengthMessage().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
              : Container()
        ]),
      ),
    );
  }

  void openMessagesPage() {
    Get.toNamed('/messages');
  }

  int lengthMessage() {
    // return controller.messagesList
    //     .where((element) => element.noti0001[0].dataLeitura == null)
    //     .length;
    return 1;
  }
}
