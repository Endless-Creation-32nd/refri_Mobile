import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:refri_mobile/components/banner_card.dart';
import 'package:refri_mobile/components/recipe_card.dart';
import 'package:refri_mobile/components/refri_app_bar.dart';
import 'package:refri_mobile/components/refri_header.dart';
import 'package:refri_mobile/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RefriAppBar(),
        RefriHeader(),
        SliverToBoxAdapter(child: _CarouselSlider()),
        SliverToBoxAdapter(child: _Recipe())
      ],
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  const _CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'asset/img/main_sample_1.png',
      'asset/img/main_sample_2.png',
      'asset/img/main_sample_3.png',
    ];

    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 236,
      ),
      items: [0, 1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return BannerCard(
              id: i,
              image: images[i],
            );
          },
        );
      }).toList(),
    ));
  }
}

class _Recipe extends StatelessWidget {
  const _Recipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '현재 재료로 추천하는 레시피',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: BLACK_COLOR),
              ),
              Text(
                '전체보기',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: SECONDARY_COLOR,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RecipeCard(),
            RecipeCard(),
          ])
        ],
      ),
    );
  }
}
