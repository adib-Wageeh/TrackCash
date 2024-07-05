import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/enums/transaction_type.dart';

class TransactionEntity extends Equatable {
  final int id;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final String description;

  const TransactionEntity(
      {required this.description,
      required this.type,
      required this.date,
      required this.amount,
      required this.id});

  @override
  List<Object?> get props => [amount, type, date, id, description];
}

class TransactionType {
  final int id;
  final transactionTypeEnum category;
  final int type;
  final String imagePath;
  final Color color;

  factory TransactionType.firstIncome() {
    return TransactionType(
        id: 1,
        category: transactionTypeEnum.salary,
        type: 1,
        imagePath: "assets/income/money.png",
        color: Color(0xff4ea0ee));
  }

  factory TransactionType.firstExpense() {
    return TransactionType(
        id: 1,
        category: transactionTypeEnum.food,
        type: 2,
        imagePath: "assets/expense/grocery.png",
        color: Color(0xff4ea0ee));
  }

  static List<TransactionType> get incomeTypes => [
        TransactionType(
            id: 1,
            category: transactionTypeEnum.salary,
            type: 1,
            imagePath: "assets/income/money.png",
            color: Color(0xff4ea0ee)),
    TransactionType(
        id: 2,
        category: transactionTypeEnum.bonus,
        type: 1,
        imagePath: "assets/income/gift.png",
        color: Color(0xffEDC73B)),
    TransactionType(
        id: 3,
        category: transactionTypeEnum.allowance,
        type: 1,
        imagePath: "assets/income/give-money.png",
        color: Color(0xff37C9A6)),
    TransactionType(
        id: 4,
        category: transactionTypeEnum.loan,
        type: 1,
        imagePath: "assets/income/signing.png",
        color: Color(0xffCC45EE)),
      ];


  static List<TransactionType> get expenseTypes => [
    TransactionType(
        id: 1,
        category: transactionTypeEnum.food,
        type: 2,
        imagePath: "assets/expense/grocery.png",
        color: Color(0xff4ea0ee)),
    TransactionType(
        id: 2,
        category: transactionTypeEnum.beauty,
        type: 2,
        imagePath: "assets/expense/skincare.png",
        color: Color(0xffE76161)),
    TransactionType(
        id: 3,
        category: transactionTypeEnum.transportation,
        type: 2,
        imagePath: "assets/expense/bus.png",
        color: Color(0xff37C9A6)),
    TransactionType(
        id: 4,
        category: transactionTypeEnum.household,
        type: 2,
        imagePath: "assets/expense/home.png",
        color: Color(0xffCC45EE)),
    TransactionType(
        id: 5,
        category: transactionTypeEnum.apparel,
        type: 2,
        imagePath: "assets/expense/wardrobe.png",
        color: Color(0xffF99B7D)),
    TransactionType(
        id: 6,
        category: transactionTypeEnum.selfDevelopment,
        type: 2,
        imagePath: "assets/expense/specification.png",
        color: Color(0xffEDC73B)),
    TransactionType(
        id: 7,
        category: transactionTypeEnum.health,
        type: 2,
        imagePath: "assets/expense/healthcare.png",
        color: Color(0xff917FB3)),
    TransactionType(
        id: 8,
        category: transactionTypeEnum.education,
        type: 2,
        imagePath: "assets/expense/education.png",
        color: Color(0xff9E6F21)),
  ];


  TransactionType(
      {required this.type,
      required this.id,
      required this.imagePath,
      required this.category,
      required this.color});
}
