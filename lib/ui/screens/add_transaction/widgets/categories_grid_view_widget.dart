import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'category_widget.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  final List<TransactionType> types;
  final int selectedTypeId;
  final Function(TransactionType) onChange;

  const CategoriesGridViewWidget(
      {required this.selectedTypeId,
      required this.types,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("categories".tr(), style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 8.0),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          padding: EdgeInsets.zero,
          children: List.generate(
              types.length,
              (index) => CategoryWidget(
                    isSelected: (types[index].id == selectedTypeId),
                    type: types[index],
                    onTap: () => onChange(types[index]),
                  )),
        ),
      ],
    );
  }
}
