import 'package:flutter/material.dart';
import '../widget/rows_spliter.dart';
import '../widget/switch_row_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const [
        SwitchRowWidget(),
        RowsSpliter()
      ],
    );
  }
}





