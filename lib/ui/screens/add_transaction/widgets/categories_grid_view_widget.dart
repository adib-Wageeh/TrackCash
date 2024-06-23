import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'category_widget.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  final List<TransactionType> types;
  final int selectedTypeId;
  final Function(TransactionType) onChange;
  const CategoriesGridViewWidget({required this.selectedTypeId,
    required this.types,required this.onChange,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 200
          ,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0,bottom: 8),
                  child: Text("Categories",style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.15), padding: EdgeInsets.zero,
                    children: List.generate(types.length, (index) =>
                        CategoryWidget(
                          isSelected: (types[index].id == selectedTypeId),
                          type: types[index],
                          onTap: ()=> onChange(types[index]),
                        ))
                    ,
                  ),
                ),
              ],
            ),
          );
  }
}
