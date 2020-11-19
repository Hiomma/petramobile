import 'package:petramobile/models/auth0000/auth0003.model.dart';
import 'package:petramobile/models/auth0000/auth0004.model.dart';

import 'auth0001.model.dart';

class Auth0000 {
  int codigo;
  String emailmaster;
  String senhamaster;
  String empresa;
  String cnpj;
  String host;
  String path;
  String url;
  String expira;
  String bloqueado;
  String versaonfe;
  String versaoqrcodenfce;
  String responsaveltecnico;
  String idcsrt;
  String csrt;
  String idtoken;
  String token;
  String carregacertificadonfse;
  String enviosincrononfse;
  String formaemissao;
  int timeout;
  int timederetornodeconsulta;
  int qtdedetentativasdeconsulta;
  String username;
  String password;
  String doctosfiscais;
  String uf;
  String datacadastro;
  String estatisticas;
  String situacao;
  String dataaquisicao;
  String plano;
  List<Auth0001> auth0001;
  List<Auth0003> auth0003;
  List<Auth0004> auth0004;

  Auth0000(
      {this.codigo,
      this.emailmaster,
      this.senhamaster,
      this.empresa,
      this.cnpj,
      this.host,
      this.path,
      this.url,
      this.expira,
      this.bloqueado,
      this.versaonfe,
      this.versaoqrcodenfce,
      this.responsaveltecnico,
      this.idcsrt,
      this.csrt,
      this.idtoken,
      this.token,
      this.carregacertificadonfse,
      this.enviosincrononfse,
      this.formaemissao,
      this.timeout,
      this.timederetornodeconsulta,
      this.qtdedetentativasdeconsulta,
      this.username,
      this.password,
      this.doctosfiscais,
      this.uf,
      this.datacadastro,
      this.estatisticas,
      this.situacao,
      this.dataaquisicao,
      this.plano,
      this.auth0001,
      this.auth0003,
      this.auth0004});

  factory Auth0000.fromJson(Map<String, dynamic> json) {
    return Auth0000(
      codigo: json['codigo'],
      emailmaster: json['emailmaster'],
      senhamaster: json['senhamaster'],
      empresa: json['empresa'],
      cnpj: json['cnpj'],
      host: json['host'],
      path: json['path'],
      url: json['url'],
      expira: json['expira'],
      bloqueado: json['bloqueado'],
      versaonfe: json['versaonfe'],
      versaoqrcodenfce: json['versaoqrcodenfce'],
      responsaveltecnico: json['responsaveltecnico'],
      idcsrt: json['idcsrt'],
      csrt: json['csrt'],
      idtoken: json['idtoken'],
      token: json['token'],
      carregacertificadonfse: json['carregacertificadonfse'],
      enviosincrononfse: json['enviosincrononfse'],
      formaemissao: json['formaemissao'],
      timeout: json['timeout'],
      timederetornodeconsulta: json['timederetornodeconsulta'],
      qtdedetentativasdeconsulta: json['qtdedetentativasdeconsulta'],
      username: json['username'],
      password: json['password'],
      doctosfiscais: json['doctosfiscais'],
      uf: json['uf'],
      datacadastro: json['datacadastro'],
      estatisticas: json['estatisticas'],
      situacao: json['situacao'],
      dataaquisicao: json['dataaquisicao'],
      plano: json['plano'],
      auth0001: Auth0001.fromJson(json['auth0001']),
      auth0003: Auth0003.fromJson(json['auth0003']),
      auth0004: Auth0004.fromJson(json['auth0004']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['emailmaster'] = emailmaster;
    data['senhamaster'] = senhamaster;
    data['empresa'] = empresa;
    data['cnpj'] = cnpj;
    data['host'] = host;
    data['path'] = path;
    data['url'] = url;
    data['expira'] = expira;
    data['bloqueado'] = bloqueado;
    data['versaonfe'] = versaonfe;
    data['versaoqrcodenfce'] = versaoqrcodenfce;
    data['responsaveltecnico'] = responsaveltecnico;
    data['idcsrt'] = idcsrt;
    data['csrt'] = csrt;
    data['idtoken'] = idtoken;
    data['token'] = token;
    data['carregacertificadonfse'] = carregacertificadonfse;
    data['enviosincrononfse'] = enviosincrononfse;
    data['formaemissao'] = formaemissao;
    data['timeout'] = timeout;
    data['timederetornodeconsulta'] = timederetornodeconsulta;
    data['qtdedetentativasdeconsulta'] = qtdedetentativasdeconsulta;
    data['username'] = username;
    data['password'] = password;
    data['doctosfiscais'] = doctosfiscais;
    data['uf'] = uf;
    data['datacadastro'] = datacadastro;
    data['estatisticas'] = estatisticas;
    data['situacao'] = situacao;
    data['dataaquisicao'] = dataaquisicao;
    data['plano'] = plano;
    if (auth0001 != null) {
      data['auth0001'] = auth0001.map((v) => v.toJson()).toList();
    }

    if (auth0003 != null) {
      data['auth0003'] = auth0003.map((v) => v.toJson()).toList();
    }
    if (auth0004 != null) {
      data['auth0004'] = auth0004.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
