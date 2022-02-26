import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common{
  static searchBar({TextEditingController? controller,
    required Function? onChanged, String? hint}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value){
          onChanged!(value);
        },
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          hintText: hint,
          suffixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(13),
        ),
      ),
    );
  }
}