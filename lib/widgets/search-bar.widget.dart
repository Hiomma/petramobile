import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  SearchBarWidget({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey[300],
      child: TextField(
        maxLines: 1,
        controller: controller,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 16, left: 16),
          hintText: 'Pesquisar...',
          suffixIcon: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.search,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
