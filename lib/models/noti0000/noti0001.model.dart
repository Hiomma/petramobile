class Noti0001 {
  DateTime dataLeitura;
  int empresa;
  int usuario;

  Noti0001({this.dataLeitura, this.empresa, this.usuario});

  static List<Noti0001> fromJson(List<dynamic> json) {
    return json
        .map((element) => Noti0001(
            dataLeitura: element['data_leitura'] != null
                ? DateTime.parse(element['data_leitura'])
                : null,
            empresa: element['empresa'],
            usuario: element['usuario']))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data_leitura'] = dataLeitura;
    data['empresa'] = empresa;
    data['usuario'] = usuario;
    return data;
  }
}
