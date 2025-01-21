import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Picturenetwork extends StatefulWidget {
  const Picturenetwork({super.key});

  @override
  State<Picturenetwork> createState() => _PicturenetworkState();
}

class _PicturenetworkState extends State<Picturenetwork> {
  String imagepath =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_EZ7L-Ehpd731tmz0hklIq_IteOi2tb4R6Q&s";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(20), children: [
          Text("Cached Network Image"),
          CachedNetworkImage(
            height: 150,
            width: 300,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(
              color: Colors.amber,
            ),
            key: UniqueKey(),
            imageUrl: "http://via.placeholder.com/350x150",
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Network Image"),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imagepath))),
          )
        ]),
      ),
    );
  }
}
