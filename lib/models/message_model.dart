import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderUid;
  String? receiverUid;
  Timestamp? dateTime;
  String? text;
  String? imageUrl;
  MessageModel({
    required this.senderUid,
    required this.receiverUid,
    required this.dateTime,
    required this.text,
    required this.imageUrl,
  });
  MessageModel.fromJson(Map<String,dynamic>json){
    senderUid = json['senderUid'];
    receiverUid = json['receiverUid'];
    dateTime = json['dateTime'];
    text = json['text'];
    imageUrl = json['imageUrl'];
  }
  Map<String, dynamic> toMap(){
    return {
      'receiverUid':receiverUid,
      'senderUid':senderUid,
      'dateTime':dateTime,
      'text':text,
      'imageUrl':imageUrl,
    };
  }
}