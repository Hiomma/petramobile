class Auth0004 {
  String empresa;
  String email;
  int codigo;
  String tokenauth;
  String login;
  String lastreq;

  Auth0004(
      {this.empresa,
      this.email,
      this.codigo,
      this.tokenauth,
      this.login,
      this.lastreq});

  static List<Auth0004> fromJson(List<dynamic> json) {
    return json
        .map(
          (element) => Auth0004(
            empresa: element['empresa'],
            email: element['email'],
            codigo: element['codigo'],
            tokenauth: element['tokenauth'],
            login: element['login'],
            lastreq: element['lastreq'],
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['empresa'] = empresa;
    data['email'] = email;
    data['codigo'] = codigo;
    data['tokenauth'] = tokenauth;
    data['login'] = login;
    data['lastreq'] = lastreq;
    return data;
  }
}
