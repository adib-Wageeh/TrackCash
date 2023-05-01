import 'package:flutter/material.dart';
import '../widget/rows_spliter.dart';
import '../widget/switch_row_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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





