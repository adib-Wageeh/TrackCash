import 'package:flutter/material.dart';
import 'package:track_cash/core/res/colors.dart';

class TransactionTypeButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  const TransactionTypeButtonWidget({required this.onPressed
    ,required this.isSelected,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.070),
      child: InkWell(
        onTap: ()=>onPressed(),
        child:
        Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(text,style: TextStyle(
                  fontSize: 22
                  ,color: (isSelected)?AppColors.primaryColor:Colors.white.withOpacity(0.5))),
              const SizedBox(height: 5,),
              (isSelected)?
              Container(height: 2.5,color: AppColors.primaryColor,width: 100,):Container()
            ],
          ),
        ),
      ),
    );
  }
}