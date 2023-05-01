import 'package:flutter/material.dart';

class RowsSpliter extends StatelessWidget {
  const RowsSpliter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child:Container(height: 0.5,width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor
            ,))
      ,
    );
  }
}
