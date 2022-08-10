import 'package:flutter/material.dart';
import 'package:refri_mobile/const/colors.dart';

class RefriAppBar extends StatelessWidget {
  const RefriAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 40,
      backgroundColor: PRIMARY_COLOR,
      title: Text("REFRI", style: TextStyle(color: BLACK_COLOR)),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none, color: BLACK_COLOR),
          onPressed: () {},
        ),
      ],
    );
  }
}
