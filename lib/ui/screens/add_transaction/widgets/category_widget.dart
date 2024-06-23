import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';

class CategoryWidget extends StatelessWidget {
  final TransactionType type;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryWidget(
      {required this.isSelected,
      required this.type,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onTap(),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isSelected) ? type.color : const Color(0xffa4b7b1)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(type.imagePath, color: Colors.white),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              type.category,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: (isSelected) ? type.color : Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
