
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? name;
  String? image;
  Timestamp? dateTime;
  String? text;
  String? uid;
  CommentModel({
    required this.name,
    required this.image,
    required this.dateTime,
    required this.text,
    required this.uid,
  });
  CommentModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap(){
    return {
      'image':image,
      'name':name,
      'dateTime':dateTime,
      'text':text,
      'uid':uid,
    };
  }
}