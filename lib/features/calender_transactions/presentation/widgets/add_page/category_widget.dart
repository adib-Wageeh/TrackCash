import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/change_category/change_category_cubit.dart';

class CategoryWidget extends StatelessWidget {
  final Enum text;
  final Map<String,dynamic> imageWithColor;
  final int index;
  final int selectedIndex;
  const CategoryWidget({required this.index,required this.selectedIndex,required this.imageWithColor,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        BlocProvider.of<ChangeCategoryCubit>(context).onCategoryChange(newCategoryIndex:text.index);
      }
      ,child: Column(
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (selectedIndex == index)? imageWithColor.values.elementAt(index) : const Color(0xffa4b7b1)
          ),
          child: Padding(padding: const EdgeInsets.all(10),
            child: Image.asset(imageWithColor.keys.elementAt(index),color: Colors.white),
          ),
        ),

        FittedBox(
          child: Text(text.name,overflow: TextOverflow.ellipsis,
            style: TextStyle(color: (selectedIndex == index)? imageWithColor.values.elementAt(index):Theme.of(context).accentColor),
          ),
        )
      ],
    ),
    );
  }
}

