import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/login.controller.dart';
import 'package:petramobile/pages/login/organizacoes.modal.dart';
import 'package:petramobile/routes.dart';
import 'package:petramobile/services/snackbar.service.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => FormBuilder(
          key: _fbKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromRGBO(41, 51, 95, 1),
                  Color.fromRGBO(174, 39, 44, 1),
                ])),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 350,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    FormBuilderTextField(
                      attribute: 'login',
                      decoration: InputDecoration(labelText: 'Usuário'),
                      validators: [],
                    ),
                    FormBuilderTextField(
                      attribute: 'senha',
                      decoration: InputDecoration(labelText: 'Senha'),
                      validators: [FormBuilderValidators.minLength(3)],
                      obscureText: true,
                    ),
                    GetX<LoginController>(
                      builder: (_) {
                        return !_.loading.value
                            ? Container(
                                margin: EdgeInsets.only(top: 24),
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () => autenticar(_, context),
                                  color: Color.fromRGBO(41, 51, 95, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 16),
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void autenticar(LoginController controller, context) async {
    try {
      if (_fbKey.currentState.saveAndValidate()) {
        await controller.autenticar(_fbKey.currentState.value);

        var width = MediaQuery.of(context).size.width - 50;
        var height = 400.toDouble();

        final response = await Get.dialog(
          Center(
            child: Container(
              width: width,
              height: height,
              child: OrganizacoesModal(),
            ),
          ),
        );

        if (response) {
          await Get.offNamed(RoutesPath.Home);
        }
      }
    } catch (error) {
      Get.find<SnackbarService>()
          .error('Atenção', 'E-mail ou senha incorretos!');
    }
  }
}
