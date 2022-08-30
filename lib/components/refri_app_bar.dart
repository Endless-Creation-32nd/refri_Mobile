import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refri_mobile/const/colors.dart';

class RefriAppBar extends StatelessWidget {
  const RefriAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 40,
      backgroundColor: PRIMARY_COLOR,
      title: SvgPicture.asset(
        'asset/svg/logo_icon.svg',
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'asset/svg/noti_icon.svg',
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
