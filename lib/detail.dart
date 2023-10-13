
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  String imgaddress;
  String title;
  String desc;

  Detailpage(
      {super.key,
        required this.imgaddress,
        required this.title,
        required this.desc});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(height: 200,
              width: 400,
              decoration: BoxDecoration(
            image: DecorationImage(
              image:widget.imgaddress != null
                  ? NetworkImage(widget.imgaddress)
                  :  const NetworkImage(
                  "https://portal.staralliance.com/cms/aux-pictures/prototype-images/avatar-default.png/@@images/image.png"),)
          )),
          Text(widget.title ?? 'error', style: const TextStyle(fontSize: 20),
          )
          ,
          Text(
            widget.desc ?? "Desc not found!!" ,style: const TextStyle(fontSize: 20)
          )
        ],
      ),
    );
  }
}
