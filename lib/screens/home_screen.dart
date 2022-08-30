import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:refri_mobile/components/article_card.dart';
import 'package:refri_mobile/components/banner_card.dart';
import 'package:refri_mobile/components/content_card.dart';
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
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          RefriAppBar(),
          RefriHeader(),
          SliverToBoxAdapter(child: _CarouselSlider()),
          SliverToBoxAdapter(child: _Recipe()),
          SliverToBoxAdapter(child: Container(height: 6, color: PRIMARY_COLOR)),
          SliverToBoxAdapter(child: _Contents()),
          SliverToBoxAdapter(child: _Refriends()),
          SliverToBoxAdapter(child: _Article()),
        ],
      ),
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
        autoPlay: true,
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
            RecipeCard(
              title: "샐러드로 채운 아보카도",
              tags: ["키토", "비건", "가벼운"],
              image: "asset/img/recipe_sample_1.png",
            ),
            RecipeCard(
              title: "연어 바지락 크림스프",
              tags: ["키토", "따뜻한", "편안한"],
              image: "asset/img/recipe_sample_2.png",
            ),
          ])
        ],
      ),
    );
  }
}

class _Contents extends StatelessWidget {
  const _Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '이번달 인기 컨텐츠 TOP 6',
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
          SizedBox(
            height: 257,
            child: GridView.count(
              childAspectRatio: 75.2 / 265.37,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 13.5,
              crossAxisSpacing: 14.7,
              crossAxisCount: 3,
              children: const [
                ContentCard(
                    rank: 1,
                    title: '리프리 여름주의보!\n식재료 관리법 바로알기',
                    image: "asset/img/content_sample_1.png",
                    viewCount: 2475),
                ContentCard(
                    rank: 2,
                    title: '아보카도 AtoZ :\n어디까지 활용해봤나요?',
                    image: "asset/img/content_sample_2.png",
                    viewCount: 2475),
                ContentCard(
                    rank: 3,
                    title: '집밥 마스터클래스!\n소스로 자취요리 레벨업',
                    image: "asset/img/content_sample_3.png",
                    viewCount: 2475),
                ContentCard(
                    rank: 4,
                    title: '리프리 여름주의보!\n식재료 관리법 바로알기',
                    image: "asset/img/content_sample_4.png",
                    viewCount: 2475),
                ContentCard(
                    rank: 5,
                    title: '리프리 여름주의보!\n식재료 관리법 바로알기',
                    image: "asset/img/content_sample_5.png",
                    viewCount: 2475),
                ContentCard(
                    rank: 6,
                    title: '리프리 여름주의보!\n식재료 관리법 바로알기',
                    image: "asset/img/content_sample_6.png",
                    viewCount: 2475),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Refriends extends StatelessWidget {
  const _Refriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '집밥잘알 리프렌즈',
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
            SizedBox(height: 14),
            SizedBox(
              height: 88,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "asset/img/profile_image_sample_${index + 1}.png"),
                        ),
                      ),
                      Text("닉네임 ${index + 1}",
                          style: TextStyle(fontSize: 12, color: BLACK_COLOR)),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Article extends StatelessWidget {
  const _Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '최근 리프렌즈 게시글',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ArticleCard(
                  title: "인기 컨텐츠에 아보카도 AtoZ레시피 따라해봤어요",
                  nickname: "sjsjsj1246",
                  image: "asset/img/article_sample_1.png",
                  viewCount: 24,
                  likeCount: 15,
                  commentCount: 8),
            ],
          )
        ],
      ),
    );
  }
}