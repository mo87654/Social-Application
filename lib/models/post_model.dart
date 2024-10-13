import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? image;
  String? name;
  Timestamp? dateTime;
  String? text;
  String? postImage;
  String? uid;

  PostModel({
    this.image,
    this.name,
    this.dateTime,
    this.text,
    this.postImage,
    this.uid,
});

  PostModel.fromJson(Map<String, dynamic> json)
  {
    image = json['image'];
    name = json['name'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
    uid = json['uid'];
  }

  Map<String, dynamic> toMap(){
    return {
      'image':image,
      'name':name,
      'dateTime':dateTime,
      'text':text,
      'postImage':postImage,
      'uid':uid,
    };
  }
}