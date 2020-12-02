import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/messages.controller.dart';
import 'package:petramobile/widgets/bar-chart/bar-chart.widget.dart';
import 'package:petramobile/widgets/drawer/drawer.widget.dart';
import 'package:petramobile/widgets/line-chart/line-chart.widget.dart';
import 'package:petramobile/widgets/notification.widget.dart';

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
          NotificationWidget(),
        ],
      ),
      drawer: DrawerWidget(),
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
}
