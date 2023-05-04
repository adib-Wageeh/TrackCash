import 'package:flutter/material.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';

class TransactionTypeTotal{

  double amount;
  TransactionType type;
  Color color;
  String imagePath;
  List<TransactionEntitie> transactions;

  TransactionTypeTotal({required this.imagePath,required this.amount,required this.type,required this.transactions,required this.color});


}