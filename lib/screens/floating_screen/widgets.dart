

import 'package:flutter/material.dart';

Column textfieldWidget(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text),
      const SizedBox(height: 5),
      TextField(
        cursorHeight: 15,
        style: const TextStyle(height: 1),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
    ],
  );
}
