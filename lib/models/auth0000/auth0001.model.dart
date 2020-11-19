class Auth0001 {
  int codigo;
  int sequencia;
  String email;
  String senha;
  String expira;
  String formularios;
  String imagem;
  String tokendevice;
  String bloqueado;
  String datacadastro;

  Auth0001(
      {this.codigo,
      this.sequencia,
      this.email,
      this.senha,
      this.expira,
      this.formularios,
      this.imagem,
      this.tokendevice,
      this.bloqueado,
      this.datacadastro});

  static List<Auth0001> fromJson(List<dynamic> json) {
    return json
        .map(
          (element) => Auth0001(
            codigo: element['codigo'],
            sequencia: element['sequencia'],
            email: element['email'],
            senha: element['senha'],
            expira: element['expira'],
            formularios: element['formularios'],
            imagem: element['imagem'],
            tokendevice: element['tokendevice'],
            bloqueado: element['bloqueado'],
            datacadastro: element['datacadastro'],
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['sequencia'] = sequencia;
    data['email'] = email;
    data['senha'] = senha;
    data['expira'] = expira;
    data['formularios'] = formularios;
    data['imagem'] = imagem;
    data['tokendevice'] = tokendevice;
    data['bloqueado'] = bloqueado;
    data['datacadastro'] = datacadastro;
    return data;
  }
}
