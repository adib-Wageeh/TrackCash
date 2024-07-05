import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/enums/transaction_type.dart';
import '../../assets/assets.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel(
      {required String description,
      required TransactionType type,
      required double amount,
      required DateTime date,
      required int id,})
      : super(
            type: type,
            date: date,
            amount: amount,
            id: id,
            description: description);

  TransactionModel copyWith(TransactionType? newTransactionType,
      double? newAmount, DateTime? dateTime) {
    return TransactionModel(
        type: newTransactionType ?? super.type,
        amount: newAmount ?? super.amount,
        date: dateTime ?? super.date,
        id: super.id,
        description: description);
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final imageAndColor = setColorAndImage(json);
    return TransactionModel(
        description: json['description'],
        type: TransactionType(
            type: json['type'],
            id: json['transactionTypeId'],
            color: imageAndColor['color'],
            category: transactionTypeFromJson(json['category']),
            imagePath: imageAndColor['imagePath']),
        amount: double.parse(json['amount']),
        date: DateTime(json['year'], json['month'], json['day']),
        id: json['id']);
  }

  static transactionTypeEnum transactionTypeFromJson(String type) {
    switch (type) {
      case 'salary':
        return transactionTypeEnum.salary;
      case 'bonus':
        return transactionTypeEnum.bonus;
      case 'allowance':
        return transactionTypeEnum.allowance;
      case 'loan':
        return transactionTypeEnum.loan;
      case 'food':
        return transactionTypeEnum.food;
      case 'beauty':
        return transactionTypeEnum.beauty;
      case 'transportation':
        return transactionTypeEnum.transportation;
      case 'household':
        return transactionTypeEnum.household;
      case 'apparel':
        return transactionTypeEnum.apparel;
      case 'selfDevelopment':
        return transactionTypeEnum.selfDevelopment;
      case 'health':
        return transactionTypeEnum.health;
      case 'education':
        return transactionTypeEnum.education;
      default:
        throw Exception('Unknown transaction type: $type');
    }
  }

  // adds color and image to transaction model object
  static Map<String, dynamic> setColorAndImage(Map<String, dynamic> json) {
    Map<String, dynamic> imageAndColor = {};
    // 1 = income
    if (json['type'] == 1) {
      switch (json['category']) {
        case "salary":
          imageAndColor.addAll({
            "imagePath": Assets.incomeImages.keys.elementAt(0),
            "color": Assets.incomeImages.values.elementAt(0)
          });
          break;
        case "bonus":
          imageAndColor.addAll({
            "imagePath": Assets.incomeImages.keys.elementAt(1),
            "color": Assets.incomeImages.values.elementAt(1)
          });
          break;
        case "allowance":
          imageAndColor.addAll({
            "imagePath": Assets.incomeImages.keys.elementAt(2),
            "color": Assets.incomeImages.values.elementAt(2)
          });
          break;
        case "loan":
          imageAndColor.addAll({
            "imagePath": Assets.incomeImages.keys.elementAt(3),
            "color": Assets.incomeImages.values.elementAt(3)
          });
          break;
      }
    }
    // 2 = expense
    else {
      switch (json['category']) {
        case "food":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(0),
            "color": Assets.expenseImages.values.elementAt(0)
          });
          break;
        case "beauty":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(1),
            "color": Assets.expenseImages.values.elementAt(1)
          });
          break;
        case "transportation":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(2),
            "color": Assets.expenseImages.values.elementAt(2)
          });
          break;
        case "household":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(3),
            "color": Assets.expenseImages.values.elementAt(3)
          });
          break;
        case "apparel":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(4),
            "color": Assets.expenseImages.values.elementAt(4)
          });
          break;
        case "selfDevelopment":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(5),
            "color": Assets.expenseImages.values.elementAt(5)
          });
          break;
        case "health":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(6),
            "color": Assets.expenseImages.values.elementAt(6)
          });
          break;
        case "education":
          imageAndColor.addAll({
            "imagePath": Assets.expenseImages.keys.elementAt(7),
            "color": Assets.expenseImages.values.elementAt(7)
          });
          break;
      }
    }

    return imageAndColor;
  }
}
