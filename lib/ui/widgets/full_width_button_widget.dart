
import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClicked;

  const FullWidthButton({
    required this.buttonText,
    required this.onClicked,
    Key? key
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 1,
          color: const Color(0xffeef1f0),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onClicked,
              child: Text(buttonText),
            ),
          )
        )
      ],
    );
  }
}