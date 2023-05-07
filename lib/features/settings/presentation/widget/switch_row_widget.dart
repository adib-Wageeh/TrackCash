import 'package:flutter/material.dart';
import 'package:track_cash/features/settings/presentation/widget/toggle_button_widget.dart';

class SwitchRowWidget extends StatelessWidget {
  const SwitchRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0,right: 12,
          top: MediaQuery.of(context).size.height*0.04
          ,bottom: 12),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Switch Mode",style: TextStyle(fontSize: 22)),
            ToggleButtonWidget()
          ],
        ),
      ),
    );
  }
}