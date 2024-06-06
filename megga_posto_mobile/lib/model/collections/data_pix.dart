// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'data_pix.g.dart';

@Collection()
class DataPix {
  Id id = Isar.autoIncrement;
  String date;
  String hour;
  double value;
  String? qrCodeId;
  String? qrCode;
  String? qrCodeBase64;

  DataPix({
    required this.date,
    required this.hour,
    required this.value,
    this.qrCodeId,
    this.qrCode,
    this.qrCodeBase64,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'hour': hour,
      'value': value,
      'qrCodeId': qrCodeId,
      'qrCode': qrCode,
      'qrCodeBase64': qrCodeBase64,
    };
  }

  factory DataPix.fromMap(Map<String, dynamic> map) {
    return DataPix(
      date: map['date'] as String,
      hour: map['hour'] as String,
      value: map['value'] is int ? (map['value'] as int).toDouble() : map['value'] as double,
      qrCodeId: map['qrCodeId'] != null ? map['qrCodeId'] as String : null,
      qrCode: map['qrCode'] != null ? map['qrCode'] as String : null,
      qrCodeBase64:
          map['qrCodeBase64'] != null ? map['qrCodeBase64'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataPix.fromJson(String source) =>
      DataPix.fromMap(json.decode(source) as Map<String, dynamic>);
}
