import 'package:flutter/material.dart';
import 'package:movie_app/widgets/text.dart';
import 'dart:ui' as ui;

class Description extends StatelessWidget {
  final String name;
  final String description;
  final String posterUrl;
  final String rating;
  final String launchDate;
  final String bannerUrl;
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.rating,
    required this.launchDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            posterUrl,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 400.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(posterUrl),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 0.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ModifiedText(
                            text: name,
                            size: 28,
                          ),
                        ),
                        ModifiedText(
                          text: '$rating/10',
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  ModifiedText(text: description, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
