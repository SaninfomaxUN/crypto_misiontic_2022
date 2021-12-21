import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class FeedModel {

  late int idFeed;
  late String idUser;
  late String userName;
  late String hour;
  late String pic;
  late bool isFav;
  late String textContent;
  late String picContent;

  FeedModel(this.idFeed,this.idUser,this.userName,this.hour,this.pic,this.isFav,this.textContent,this.picContent);

  FeedModel.optionWitoutID(this.idUser,this.userName,this.hour,this.pic,this.isFav,this.textContent,this.picContent){
    idFeed = 99;
  }
  FeedModel.empty(){
    idFeed = 0;
    idUser="";
    userName="";
    hour="";
    pic="";
    isFav=false;
    textContent="";
    picContent="";
  }


/*FeedModel.map(dynamic obj){
    this.idFeed = obj['idFeed'];
    this.idUser = obj['idUser'];
    this.userName = obj['userName'];
    this.hour = obj['hour'];
    this.pic = obj['pic'];
    this.isFav = obj['isFav'];
    this.textContent = obj['textContent'];
    this.picContent = obj['picContent'];
  }

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();

    map['idFeed'] = idFeed;
    map['idUser'] = idUser;
    map['userName'] = userName;
    map['hour'] = hour;
    map['pic'] = pic;
    map['isFav'] = isFav;
    map['textContent'] = textContent;
    map['picContent'] = picContent;
    return map;
  }

  FeedModel.fromMap(Map<String,dynamic> map){
    this.idFeed = map['idFeed'];
    this.idUser = map['idUser'];
    this.userName = map['userName'];
    this.hour = map['hour'];
    this.pic = map['pic'];
    this.isFav = false;
    this.textContent = "";
    this.picContent = "";
  }


  String get idFeed => _idFeed;
  String get idUser => _idUser;
  String get userName => _userName;
  String get hour => _hour;
  String get pic => _pic;
  bool get isFav => _isFav;
  String get textContent => _textContent;
  String get picContent => _picContent;*/
/*
  Feed.fromSnapShop(DataSnapshot snapshot){
    idFeed = snapshot.key!;
    idUser = snapshot.value['idUser'];
    userName = snapshot.value['userName'];
    hour = snapshot.value['hour'];
    pic = snapshot.value['pic'];
    isFav = snapshot.value['isFav'];
    textContent  = snapshot.value['textContent'];
    picContent = snapshot.value['picContent'];
  }*/




}