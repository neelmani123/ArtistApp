import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddWorkExperienceModel
{
  bool status;
  String message;

  AddWorkExperienceModel({this.status,this.message});
  factory AddWorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return AddWorkExperienceModel(
      status: json['status'],
      message: json['message']
    );
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['status']=this.status;
    data['message']=this.message;
    return data;
  }

}