import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/routes.dart';

class DrawerWidget extends StatelessWidget {
  final menuList = [
    {'title': 'Home', 'route': RoutesPath.Home},
    {'title': 'CRM', 'route': RoutesPath.Crms0000}
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Equipenet Sistemas',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ...menuList
              .map(
                (e) => ListTile(
                  title: Text(e['title']),
                  onTap: () => Get.offNamed(e['route']),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
