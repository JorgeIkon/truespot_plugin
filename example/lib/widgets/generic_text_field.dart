import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({Key? key, this.title, this.hint, required this.controller}) : super(key: key);

  final String? title;
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? ''),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 10,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint ?? '',
                  filled: true,
                  border: InputBorder.none
                ),
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.document_scanner_outlined))
          ],
        )
      ],
    );
  }
}
