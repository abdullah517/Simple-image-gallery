import 'package:flutter/material.dart';

class fullimg extends StatelessWidget {
  String path;
  fullimg({required this.path});

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
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: path,
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
