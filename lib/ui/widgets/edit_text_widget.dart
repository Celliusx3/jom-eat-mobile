import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EditText extends StatelessWidget {
  const EditText({
    Key? key,
    required this.title,
    required this.placeholder,
    this.minLines = 1,
    this.maxLines = 1,
    this.textEditingController,
    this.textInputType,
    this.textCapitalization,
    this.inputFormatters
  }) : super(key: key);

  final String title;
  final String placeholder;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8,),
        CupertinoTextField(
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          keyboardType: textInputType,
          controller: textEditingController,
          maxLines: maxLines,
          placeholder: placeholder,
          minLines: minLines,
          padding: const EdgeInsets.all(16),
        ),
      ],
    );
  }
}