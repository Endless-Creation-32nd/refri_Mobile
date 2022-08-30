import 'package:flutter/material.dart';
import 'package:refri_mobile/const/colors.dart';

class MainSection extends StatelessWidget {
  final String title;
  final Widget child;
  const MainSection({required this.title, required this.child, Key? key})
      : super(key: key);

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
                title,
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
          child
        ],
      ),
    );
  }
}
