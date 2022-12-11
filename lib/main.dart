import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/listimages.dart';
import 'package:myapp/lst.dart';
import 'fullimage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imglist = listimg.getlist();
  int ind = 0;
  String text = "Internet Images";
  void myfunc1(String btntext) {
    text = btntext;
    if (btntext == "Internet Images") {
      setState(() {
        ind = 0;
      });
    } else if (btntext == "Cache Images") {
      setState(() {
        ind = 1;
      });
    } else if (btntext == "Asset Images") {
      setState(() {
        ind = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: (Text("Image Gallery")),
      ),
      body: Column(
        children: [
          listcreation(myfunc: myfunc1),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(24, (index) {
                  if (text == "Internet Images") {
                    return GestureDetector(
                      child: Center(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/loading.gif',
                          image: imglist[ind][index],
                          height: 160,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  fullimg(path: imglist[ind][index]),
                            ));
                      },
                    );
                  } else if (text == "Asset Images") {
                    return GestureDetector(
                      child: Center(
                        child: Image.asset(
                          imglist[ind][index],
                          height: 160,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => fullimg(
                                path: imglist[ind][index],
                                isasset: true,
                              ),
                            ));
                      },
                    );
                  } else {
                    return GestureDetector(
                      child: Center(
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: imglist[ind][index],
                          height: 160,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  fullimg(path: imglist[ind][index]),
                            ));
                      },
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}
