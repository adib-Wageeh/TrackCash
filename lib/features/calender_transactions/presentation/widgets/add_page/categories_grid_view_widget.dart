import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/change_category/change_category_cubit.dart';
import 'category_widget.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  final List data;
  final Map<String,dynamic> images;
  const CategoriesGridViewWidget({required this.images,required this.data,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCategoryCubit, ChangeCategoryState>(
      builder: (context, state) {
        if(state is ChangeCategoryLoaded) {
          return SizedBox(
          height: 240
          ,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 12, bottom: 8),
                  child: Text("Categories",style: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4), padding: EdgeInsets.zero,
                    children: List.generate(data.length, (index) =>
                        CategoryWidget(index: index,selectedIndex: state.categoryIndex,imageWithColor: images, text: data[index]))
                    ,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
