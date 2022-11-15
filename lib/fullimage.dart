import 'package:flutter/material.dart';

class fullimg extends StatelessWidget {
  String path;
  bool isasset;
  fullimg({required this.path, this.isasset = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Image Gallery")),
      ),
      body: Center(
        child: Container(
            height: 500,
            width: 500,
            child: isasset == false
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: path,
                    height: 500,
                    width: 500,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    path,
                    height: 500,
                    width: 500,
                  )),
      ),
    );
  }
}
