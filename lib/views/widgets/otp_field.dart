import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key, required this.onCompleted});

  final Function(String) onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinInput(
      length: 4,
      builder: (context, cells) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cells.map((cell) {
            return Container(
              width: 17.w,
              height: 8.h,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: cell.isFocused ? Colors.blue : Colors.grey[200]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  cell.character ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            );
          }).toList(),
        );
      },
      onCompleted: onCompleted,
    );
  }
}
