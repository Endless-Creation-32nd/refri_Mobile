import 'package:flutter/material.dart';
import 'package:refri_mobile/screens/art_detail_screen.dart';

class BannerCard extends StatelessWidget {
  final int id;
  final String image;
  const BannerCard({required this.id, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              settings: RouteSettings(arguments: {
                'id': id,
                'image': image,
              }),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ArtDetailScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ));
      },
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(child: Image.asset(image, fit: BoxFit.cover)),
        _Content()
      ]),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("집에서\n연남동\n비건식당처럼.",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEFEFE3))),
            SizedBox(height: 8),
            Text("트렌디한 플레이팅으로\n완성하는 건강한 미식 레시피",
                style: TextStyle(fontSize: 12, color: Color(0xFFEFEFE3))),
          ],
        ),
      ),
    );
  }
}
