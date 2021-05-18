import 'dart:math';

import 'package:flutter/cupertino.dart';

final  aPPmAINuRL = 'https://artist.devclub.co.in/api/';
final aPPdOMAIN = 'https://artist.devclub.co.in/api/Artist_api/';

hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

loginButtonGradient(){
  return LinearGradient(
    colors: [
      Color(hexStringToHexInt(
          "#5f5960")),
      Color(hexStringToHexInt(
          "#5f5960")),
    ],
  );
}

String getInitials(bank_account_name) {
  String initials = "";
  if(bank_account_name != "" ){
    List<String> names = bank_account_name.split(" ");
    int numWords = 2;
    if(numWords > names.length) {
      numWords = names.length;
    }
    for(var i = 0; i < numWords; i++){
      initials += '${names[i][0]}';
    }
  }
  return initials;
}

//ColorsNew
final appBaseColor = hexStringToHexInt('#FE4879');
final appBackGreyColor = hexStringToHexInt('#f5f5f5');
final appGreyColor = hexStringToHexInt('#c5bbbb');
final appBlackColor = hexStringToHexInt('#000000');
final appLoginLineColor = hexStringToHexInt('#a6a8b6');


calculateAge(String dob) {
  final date = dob;
  final birthday = DateTime.parse(date);
  final date2 = DateTime.now();
  final difference = date2.difference(birthday).inDays;
  return (difference/365).toStringAsFixed(0);
}

