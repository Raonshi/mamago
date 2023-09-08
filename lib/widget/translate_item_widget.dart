import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamago/data/translated_item_model.dart';

class TranslateItemWidget extends StatelessWidget {
  const TranslateItemWidget({super.key, required this.item});

  final TranslateItem item;

  BoxDecoration get _decoration => BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 0.1),
            blurRadius: 3.0,
            spreadRadius: 0.5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration.copyWith(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Theme.of(context).colorScheme.background),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Text(
            item.text ?? "",
            maxLines: null,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () async {
                    Clipboard.setData(ClipboardData(text: item.text)).then(
                      (_) {
                        showDialog(
                          context: context,
                          builder: (subConText) => AlertDialog(
                            content: const Text("텍스트가 복사되었습니다."),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(subConText);
                                },
                                child: const Text("확인"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.copy)),
            ],
          )
        ],
      ),
    );
  }
}
