import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/container.png"),
          fit: BoxFit.cover,
      ),
    )),
    );
  }
}
