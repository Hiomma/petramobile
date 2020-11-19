import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/messages.controller.dart';
import 'package:petramobile/widgets/bar-chart/bar-chart.widget.dart';
import 'package:petramobile/widgets/line-chart/line-chart.widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
        centerTitle: true,
        actions: [
          GetBuilder<MessagesController>(
              builder: (_) => buildNotificationIcon()),
        ],
      ),
      body: Builder(
        builder: (context) => FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LineChartWidget(title: 'Mensagens por Mês'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BarChartWidget(title: 'Mensagens por Dia'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildNotificationIcon() {
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
    return controller.messagesList
        .where((element) => element.noti0001[0].dataLeitura == null)
        .length;
  }
}
