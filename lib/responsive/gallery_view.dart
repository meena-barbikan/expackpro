// ignore_for_file: camel_case_types

import 'package:expackpro/responsive/details_page.dart';
import 'package:expackpro/responsive/place_model.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade300,
        child: GridView.count(
          crossAxisCount: 2,
          children: allplaces
              .map((map) => GridItemWidget(
                    place: map,
                  ))
              .toList(),
        ));
  }
}

class GridItemWidget extends StatelessWidget {
  final PlaceModel place;
  const GridItemWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsView(
                      place: place,
                    )));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(place.title),
              subtitle: Text(place.sbutitle),
            ),
            child: Ink.image(
              image: NetworkImage(place.image),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  final PlaceModel place;
  const DetailsView({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.sbutitle),
      ),
      body: placedetailspage(
        place: place,
      ),
    );
  }
}

class placedetailspage extends StatefulWidget {
  final PlaceModel place;
  const placedetailspage({super.key, required this.place});

  @override
  State<placedetailspage> createState() => _placedetailspageState();
}

class _placedetailspageState extends State<placedetailspage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => constraints.maxHeight >= 600
            ? buildLargeWidget()
            : buildSmallWidget());
  }

  buildSmallWidget() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        SizedBox(
          width: double.infinity,
          height: 130,
          child: Image.network(
            widget.place.image,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: [
                  Text(widget.place.title),
                  Text(widget.place.sbutitle),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.red,
              ),
              const Text("41"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.call),
                  Text("Call"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share_location_outlined),
                  Text("Route"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share),
                  Text("Share"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(widget.place.description),
      ],
    );
  }

  buildLargeWidget() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 130,
                child: Image.network(
                  widget.place.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(widget.place.title),
                        Text(widget.place.sbutitle),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    const Text("41"),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.call),
                        Text("Call"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share_location_outlined),
                        Text("Route"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share),
                        Text("Share"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.place.description),
            ],
          ))
        ],
      ),
    );
  }
}
