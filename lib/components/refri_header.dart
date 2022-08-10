import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:refri_mobile/const/colors.dart';

class RefriHeader extends StatelessWidget {
  const RefriHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _SliverFixedHeaderDelegate(
      child: Container(
          color: PRIMARY_COLOR,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: SizedBox(
              height: 38,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: BLACK_COLOR, width: 1.5),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: BLACK_COLOR, width: 1.5),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  labelText: '재료명, 레시피, 리프렌즈를 찾아보세요.',
                  labelStyle: TextStyle(color: BLACK_COLOR, fontSize: 12),
                  suffixIcon: Icon(Icons.search, color: BLACK_COLOR),
                ),
              ),
            ),
          )),
      maxHeight: 70,
      minHeight: 7,
    ));
  }
}

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate(
      {required this.child, required this.maxHeight, required this.minHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
