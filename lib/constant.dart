import 'package:flutter/material.dart';

Widget SpaceBar() {
  return Padding(
    padding: const EdgeInsets.only(left:20, right: 20, bottom: 10,),
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.left,
          cursorColor: Colors.black45,
          decoration: InputDecoration(
            focusColor: Colors.blue,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black45,
              size: 24,
            ),
            hintText: "Search by Title",
            hintStyle: TextStyle(color: Colors.black45, fontSize: 18),
            border: InputBorder.none,

          ),
        ),
      ),
    ),
  );
}
