import 'package:petramobile/models/auth0000/auth0000.model.dart';
import 'package:petramobile/models/noti0000/noti0001.model.dart';

class Noti0000 {
  DateTime dataEnvio;
  DateTime dataProgramada;
  int id;
  String mensagem;
  String titulo;
  List<Noti0001> noti0001;

  Noti0000(
      {this.dataEnvio,
      this.id,
      this.mensagem,
      this.titulo,
      this.dataProgramada,
      this.noti0001});

  factory Noti0000.fromJson(Map<String, dynamic> json) {
    return Noti0000(
      dataEnvio: DateTime.parse(json['data_envio']),
      dataProgramada: json['data_programada'] != null
          ? DateTime.parse(json['data_programada'])
          : null,
      id: json['id'],
      mensagem: json['mensagem'],
      titulo: json['titulo'],
      noti0001: Noti0001.fromJson(json['noti0001']),
    );
  }

  factory Noti0000.fromDwJson(
      Map<String, dynamic> json, List<Auth0000> authList) {
    var noti0001 = <Map<String, dynamic>>[];

    authList.forEach((auth0000) {
      auth0000.auth0001.forEach((auth0001) {
        var data = <String, dynamic>{};

        data['empresa'] = auth0000.codigo;
        data['usuario'] = auth0001.sequencia;

        noti0001.add(data);
      });
    });

    return Noti0000(
        mensagem: json['mensagem'],
        titulo: json['titulo'],
        dataProgramada: json['data_programada'],
        noti0001: Noti0001.fromJson(noti0001));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data_envio'] = dataEnvio;
    data['id'] = id;
    data['mensagem'] = mensagem;
    data['titulo'] = titulo;
    if (noti0001 != null) {
      data['noti0001'] = noti0001.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
