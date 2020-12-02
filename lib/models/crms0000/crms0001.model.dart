class Crms0001 {
  int codigo;
  int sequencia;
  String horainicial;
  String horafinal;
  String tempo;
  String usuarioatual;
  String data;
  String parecer;
  String followupMeta;
  String emailcliente;
  String usuario;
  String os;
  String kanban;
  String sinalizacaokanban;
  String dataefetivada;
  String horainicialprevisao;
  String horafinalprevisao;
  String dataprevisao;
  String tempoprevisao;

  Crms0001(
      {this.codigo,
      this.sequencia,
      this.horainicial,
      this.horafinal,
      this.tempo,
      this.usuarioatual,
      this.data,
      this.parecer,
      this.followupMeta,
      this.emailcliente,
      this.usuario,
      this.os,
      this.kanban,
      this.sinalizacaokanban,
      this.dataefetivada,
      this.horainicialprevisao,
      this.horafinalprevisao,
      this.dataprevisao,
      this.tempoprevisao});

  static List<Crms0001> fromJson(List<dynamic> json) {
    return json
        .map((element) => Crms0001(
              codigo: element['codigo'],
              sequencia: element['sequencia'],
              horainicial: element['horainicial'],
              horafinal: element['horafinal'],
              tempo: element['tempo'],
              usuarioatual: element['usuarioatual'],
              data: element['data'],
              parecer: element['parecer'],
              followupMeta: element['followup_meta'],
              emailcliente: element['emailcliente'],
              usuario: element['usuario'],
              os: element['os'],
              kanban: element['kanban'],
              sinalizacaokanban: element['sinalizacaokanban'],
              dataefetivada: element['dataefetivada'],
              horainicialprevisao: element['horainicialprevisao'],
              horafinalprevisao: element['horafinalprevisao'],
              dataprevisao: element['dataprevisao'],
              tempoprevisao: element['tempoprevisao'],
            ))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['sequencia'] = sequencia;
    data['horainicial'] = horainicial;
    data['horafinal'] = horafinal;
    data['tempo'] = tempo;
    data['usuarioatual'] = usuarioatual;
    data['data'] = data;
    data['parecer'] = parecer;
    data['followup_meta'] = followupMeta;
    data['emailcliente'] = emailcliente;
    data['usuario'] = usuario;
    data['os'] = os;
    data['kanban'] = kanban;
    data['sinalizacaokanban'] = sinalizacaokanban;
    data['dataefetivada'] = dataefetivada;
    data['horainicialprevisao'] = horainicialprevisao;
    data['horafinalprevisao'] = horafinalprevisao;
    data['dataprevisao'] = dataprevisao;
    data['tempoprevisao'] = tempoprevisao;
    return data;
  }
}
