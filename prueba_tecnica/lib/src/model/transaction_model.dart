// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

TransactionModel userModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String userModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  final DateTime date;
  final String destinationAccount;
  final String originAccount;
  final int amountTranferred;

  TransactionModel({
    required this.date,
    required this.destinationAccount,
    required this.originAccount,
    required this.amountTranferred,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        date: json['date'].toDate(),
        originAccount: json['originAccount'],
        amountTranferred: json['amountTranferred'], 
        destinationAccount: json['destinationAccount'],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "destinationAccount": destinationAccount,
        "originAccount": originAccount,
        "amountTransferred": amountTranferred,
      };
}
