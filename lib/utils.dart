import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

String encodeBase64(String string) {
  return base64.encode(utf8.encode(string));
}

String decodeBase64(String string) {
  return utf8.decode(base64.decode(string));
}

String toLocaleDate(DateTime dateTime) {
  final formatter = DateFormat('dd/MM/yyyy hh:mm:ss');
  return formatter.format(dateTime);
}

String toStringDate(DateTime dateTime, String format) {
  final formatter = DateFormat(format);
  return formatter.format(dateTime);
}

Dio getDio() {
  return Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 100000,
    ),
  );
}
