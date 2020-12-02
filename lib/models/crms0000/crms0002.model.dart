class Crms0002 {
  int codigo;
  String usuario;
  String posicao;
  String feedback;

  Crms0002({this.codigo, this.usuario, this.posicao, this.feedback});

  static List<Crms0002> fromJson(List<dynamic> json) {
    return json
        .map(
          (element) => Crms0002(
            codigo: element['codigo'],
            usuario: element['usuario'],
            posicao: element['posicao'],
            feedback: element['feedback'],
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['usuario'] = usuario;
    data['posicao'] = posicao;
    data['feedback'] = feedback;
    return data;
  }
}
