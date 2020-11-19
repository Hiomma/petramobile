import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/controllers/login.controller.dart';
import 'package:petramobile/models/organizacoes/organizacoes.model.dart';

class OrganizacoesModal extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                'Selecione uma Organização',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                height: 270,
                child: ListView.builder(
                  itemCount: controller.organizacoesList.length,
                  itemBuilder: (context, index) {
                    final organizacao = controller.organizacoesList[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                      title: Text(organizacao.organizacao),
                      subtitle: Text(organizacao.cnpj),
                      onTap: () => login(organizacao),
                    );
                  },
                ),
              ),
              Obx(
                () => !controller.loading.value
                    ? Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => voltar(),
                          color: Color.fromRGBO(41, 51, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: Text(
                            'Voltar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 16),
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(Organizacoes organizacao) async {
    try {
      await controller.login(organizacao);

      Get.back(result: true);
    } catch (error) {
      print(error);
    }
  }

  void voltar() {
    Get.back(result: false);
  }
}
