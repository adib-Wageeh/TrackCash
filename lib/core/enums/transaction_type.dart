import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum transactionTypeEnum{
  @JsonValue('salary')
  salary,
  @JsonValue('bonus')
  bonus,
  @JsonValue('allowance')
  allowance,
  @JsonValue('loan')
  loan,
  @JsonValue('food')
  food,
  @JsonValue('beauty')
  beauty,
  @JsonValue('transportation')
  transportation,
  @JsonValue('household')
  household,
  @JsonValue('apparel')
  apparel,
  @JsonValue('selfDevelopment')
  selfDevelopment,
  @JsonValue('health')
  health,
  @JsonValue('education')
  education
}

extension transactionTypeExtension on transactionTypeEnum {

  String translate() {
    switch (this) {
      case transactionTypeEnum.salary:
        return "salary".tr();
      case transactionTypeEnum.bonus:
        return "bonus".tr();
      case transactionTypeEnum.allowance:
        return "allowance".tr();
      case transactionTypeEnum.loan:
        return "loan".tr();
      case transactionTypeEnum.food:
        return "food".tr();
      case transactionTypeEnum.beauty:
        return "beauty".tr();
      case transactionTypeEnum.transportation:
        return "transportation".tr();
      case transactionTypeEnum.household:
        return "household".tr();
      case transactionTypeEnum.apparel:
        return "apparel".tr();
      case transactionTypeEnum.selfDevelopment:
        return "selfDevelopment".tr();
      case transactionTypeEnum.health:
        return "health".tr();
      case transactionTypeEnum.education:
        return "education".tr();
    }
  }
}