import 'package:flutter/material.dart';
import '../../../../core/assets/assets.dart';
import '../../domain/entities/transaction.dart';

class TransactionModel extends TransactionEntitie{

  const TransactionModel({required String description,required TransactionType type,required double amount,required DateTime date,required int id,required String imagePath,required Color color}):super(type: type,date: date,amount: amount,id: id,color: color,imagePath: imagePath,description: description);

  TransactionModel copyWith(TransactionType? newTransactionType,double? newAmount,DateTime? dateTime,String? imagePath,Color? color){
    return TransactionModel(type: newTransactionType ?? super.type, amount: newAmount??super.amount,
        date: dateTime??super.date,id:super.id,
        imagePath: imagePath??super.imagePath,
        color: color??super.color,
        description: description??super.description
    );
  }

  factory TransactionModel.fromJson(Map<String,dynamic> json){
    final imageAndColor = setColorAndImage(json);
    return TransactionModel(
    color: imageAndColor['color'],
    description: json['description'],
    imagePath: imageAndColor['imagePath']
    ,type: TransactionType(type: json['type'],category: json['category']),
        amount: double.parse(json['amount']),
        date: DateTime(json['year'],json['month'],json['day']), id: json['id']);
  }


  // adds color and image to transaction model object
  static Map<String,dynamic> setColorAndImage(Map<String,dynamic> json){

    Map<String,dynamic> imageAndColor={};
    // 1 = income
    if(json['type'] == 1){
      switch(json['category']){

        case "Salary":
          imageAndColor.addAll({"imagePath":Assets.incomeImages.keys.elementAt(0),"color":Assets.incomeImages.values.elementAt(0)});
          break;
        case "Bonus":
          imageAndColor.addAll({"imagePath":Assets.incomeImages.keys.elementAt(1),"color":Assets.incomeImages.values.elementAt(1)});
          break;
        case "Allowance":
          imageAndColor.addAll({"imagePath":Assets.incomeImages.keys.elementAt(2),"color":Assets.incomeImages.values.elementAt(2)});
          break;
        case "Loan":
          imageAndColor.addAll({"imagePath":Assets.incomeImages.keys.elementAt(3),"color":Assets.incomeImages.values.elementAt(3)});
          break;
      }
    }
    // 2 = expense
    else{
      switch(json['category']){

        case "Food":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(0),"color":Assets.expenseImages.values.elementAt(0)});
          break;
        case "Beauty":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(1),"color":Assets.expenseImages.values.elementAt(1)});
          break;
        case "Transportation":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(2),"color":Assets.expenseImages.values.elementAt(2)});
          break;
        case "Household":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(3),"color":Assets.expenseImages.values.elementAt(3)});
          break;
        case "Apparel":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(4),"color":Assets.expenseImages.values.elementAt(4)});
          break;
        case "SelfDevelopment":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(5),"color":Assets.expenseImages.values.elementAt(5)});
          break;
        case "Health":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(6),"color":Assets.expenseImages.values.elementAt(6)});
          break;
        case "Education":
          imageAndColor.addAll({"imagePath":Assets.expenseImages.keys.elementAt(7),"color":Assets.expenseImages.values.elementAt(7)});
          break;
      }
    }

    return imageAndColor;
  }


}