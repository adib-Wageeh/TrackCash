import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/res/colors.dart';
import 'package:track_cash/ui/widgets/transaction_type_button_widget.dart';

class TransactionTypeSelectorContainerWidget extends StatelessWidget {
  const TransactionTypeSelectorContainerWidget({Key? key,required this.isIncome,required this.onPressed}) : super(key: key);
  final bool isIncome;
  final Function(int type) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.140,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46),bottomRight: Radius.circular(46))
      ),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransactionTypeButtonWidget(
                onPressed: ()=>onPressed(1)
                ,text: "income".tr(),isSelected: isIncome,),
                TransactionTypeButtonWidget(
                  onPressed: ()=>onPressed(2),
                  text: "expense".tr(),isSelected: !isIncome,)
              ],
            )
    );
  }
}