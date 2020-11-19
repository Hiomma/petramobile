class Organizacoes {
  String codigomaster;
  String codigo;
  String organizacao;
  String cnpj;
  String url;
  String host;
  String path;
  String bloqueado;

  Organizacoes(
      {this.codigomaster,
      this.codigo,
      this.organizacao,
      this.cnpj,
      this.url,
      this.host,
      this.path,
      this.bloqueado});

  factory Organizacoes.fromJson(Map<String, dynamic> json) {
    return Organizacoes(
        codigomaster: json['codigomaster'],
        codigo: json['codigo'],
        organizacao: json['organizacao'],
        cnpj: json['cnpj'],
        url: json['url'],
        host: json['host'],
        path: json['path'],
        bloqueado: json['bloqueado']);
  }

  static List<Organizacoes> fromJsonArray(List<dynamic> json) {
    return json
        .map((e) => Organizacoes.fromJson(e))
        .cast<Organizacoes>()
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigomaster'] = codigomaster;
    data['codigo'] = codigo;
    data['organizacao'] = organizacao;
    data['cnpj'] = cnpj;
    data['url'] = url;
    data['host'] = host;
    data['path'] = path;
    data['bloqueado'] = bloqueado;
    return data;
  }
}
