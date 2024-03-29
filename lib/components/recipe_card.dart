import 'package:flutter/material.dart';
import 'package:refri_mobile/const/colors.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String image;

  const RecipeCard(
      {required this.title, required this.tags, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: 163,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: BLACK_COLOR,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                          children: tags
                              .map((tag) => Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          color: PRIMARY_COLOR),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.8, vertical: 2.6),
                                        child: Text(tag,
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: SECONDARY_COLOR)),
                                      ),
                                    ),
                                  ))
                              .toList())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
