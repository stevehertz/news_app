import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:news_app/shared/listitem.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;

  const DetailsScreen({super.key, required this.tag, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: '${item.newsTitle}',
                    child: Image.network(
                      item.imgURL,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          item.newsTitle,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person),
                            Text(
                              item.author,
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Icon(Icons.date_range),
                            Text(
                              item.date,
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          lipsum.createParagraph(numParagraphs: 3),
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
