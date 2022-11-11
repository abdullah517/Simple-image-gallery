import 'Buttons.dart';
import 'package:flutter/material.dart';

class listcreation extends StatelessWidget {
  Function myfunc;
  List<String> btntext = ["Internet Images", "Cache Images", "Asset Images"];
  listcreation({required this.myfunc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>
            createbutton(btntext: btntext[index], myfunc: myfunc)),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
