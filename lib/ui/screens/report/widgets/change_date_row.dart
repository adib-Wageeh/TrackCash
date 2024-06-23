import 'package:flutter/material.dart';

class ChangeDateRow extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPreviewsPressed;
  final VoidCallback onNextPressed;
  const ChangeDateRow({
    super.key,
    required this.selectedDate,
    required this.onNextPressed,
    required this.onPreviewsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: ()=> onPreviewsPressed(),
              icon: const Icon(Icons.arrow_back_ios)),
          Text("${selectedDate.year.toString()}/${selectedDate.month.toString()}",style:
          const TextStyle(fontSize: 18)),
          IconButton(onPressed: ()=> onNextPressed(),
              icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}

