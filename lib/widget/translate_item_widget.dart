import 'package:flutter/material.dart';
import 'package:mamago/data/translated_item_model.dart';

class TranslateItemWidget extends StatelessWidget {
  const TranslateItemWidget({super.key, required this.item});

  final TranslateItem item;

  BoxDecoration get _decoration => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 0.1),
            blurRadius: 3.0,
            spreadRadius: 0.5,
            color: Colors.black45,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: const Column(
        children: [
          Row(
            children: [
              Text("Test Test"),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.copy),
            ],
          )
        ],
      ),
    );
  }
}
