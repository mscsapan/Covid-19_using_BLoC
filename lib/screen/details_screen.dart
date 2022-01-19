import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String country;
  final String image;

  const DetailScreen({Key? key, required this.country, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Hero(
                tag: image,
                  child: Image.network(image, fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }
}
