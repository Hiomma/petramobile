class Auth0003 {
  int codigo;
  int sequencia;
  String serie;
  String senha;
  String certificado;
  String cnpj;
  String ambiente;

  Auth0003(
      {this.codigo,
      this.sequencia,
      this.serie,
      this.senha,
      this.certificado,
      this.cnpj,
      this.ambiente});

  static List<Auth0003> fromJson(List<dynamic> json) {
    return json
        .map(
          (element) => Auth0003(
            codigo: element['codigo'],
            sequencia: element['sequencia'],
            serie: element['serie'],
            senha: element['senha'],
            certificado: element['certificado'],
            cnpj: element['cnpj'],
            ambiente: element['ambiente'],
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['sequencia'] = sequencia;
    data['serie'] = serie;
    data['senha'] = senha;
    data['certificado'] = certificado;
    data['cnpj'] = cnpj;
    data['ambiente'] = ambiente;
    return data;
  }
}
