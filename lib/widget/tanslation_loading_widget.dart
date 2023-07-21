import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TranslationLoadingWidget extends StatelessWidget {
  const TranslationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Lottie.asset('asset/lotties/converting.json'),
      ),
    );
  }
}
