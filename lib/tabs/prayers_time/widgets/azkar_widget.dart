import 'package:flutter/material.dart';
import 'package:islami_application/tabs/prayers_time/classes/zekrClass.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({super.key, required this.zekr});

  final ZekrCategory zekr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD4AF37), width: 2),
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withValues(alpha: 0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(zekr.image, height: 60)),
            Text(
              zekr.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}
