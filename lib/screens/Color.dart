import 'package:flutter/material.dart';

final blueGreyColor = hexStringToHexInt('#F8FAFB');
final primarycolor = hexStringToHexInt('#32353c');
final fountColor = hexStringToHexInt('#15AD91');
final blackColor = hexStringToHexInt('#000000');
final darkwhiteColor = hexStringToHexInt('#BBBBBB');
final boldColor = hexStringToHexInt('#D20283');
final Ccolor =  hexStringToHexInt('#ACDEE7');
final text_white =  hexStringToHexInt('#ffffff');
final home_title_color =  hexStringToHexInt('#15ad91');
final job_title_color =  hexStringToHexInt('#feeae9');
final home_pink_color =  hexStringToHexInt('#d20283');
final pinkcolor = hexStringToHexInt('#E363B2');
//recommended

final rec_job_heading =  hexStringToHexInt('#15ad91');
final rec_job_bg =  hexStringToHexInt('#feeae9');
final rec_time_color =  hexStringToHexInt('#a6a5a5');
final rec_title_color =  hexStringToHexInt('#201f1f');
final card_border_color =  hexStringToHexInt('#adaeb0');



hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}