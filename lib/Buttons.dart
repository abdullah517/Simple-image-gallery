import 'package:flutter/material.dart';

class createbutton extends StatelessWidget {
  String btntext;
  Function myfunc;
  createbutton({required this.btntext, required this.myfunc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        child: Text(
          btntext,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        onPressed: () => myfunc(btntext),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
