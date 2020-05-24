import 'package:flutter/material.dart';

class Company {
  String id;
  String name;
  String username;
  String mail;
  String website;
  bool verified;
  String location;
  String description;
  String imageUrl;
  String offer;

  int salaryOffer;
  List<String> references = [];
  List<String> ambassadorsIdLiked = [];
  List<String> ambassadorsIdMatched = [];
  List<String> ambassadorsIdDisliked = [];
  List<String> ambassadorsIdPool = [];
  List<String> chatsActiveId = [];

  Company({
    Key key,
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.mail,
    @required this.website,
    @required this.verified,
    @required this.location,
    @required this.description,
    @required this.offer,
    @required this.imageUrl,
    @required this.references,
    @required this.salaryOffer,
    this.ambassadorsIdLiked,
    this.ambassadorsIdMatched,
    this.ambassadorsIdDisliked,
    this.ambassadorsIdPool,
    this.chatsActiveId,
  });
}
