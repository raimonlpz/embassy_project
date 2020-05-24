import 'package:flutter/material.dart';

class Chat {
  String id;
  String idAmbassador;
  String idCompany;
  List<Map<String, String>> messages = [];

  Chat({
    @required this.id,
    @required this.idAmbassador,
    @required this.idCompany,
    this.messages,
  });
}
