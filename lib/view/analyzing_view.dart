import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class AnalyzingView extends StatefulWidget {
  @override
  _AnalyzingViewState createState() => _AnalyzingViewState();
}

class _AnalyzingViewState extends State<AnalyzingView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed('/resultPage');
    });
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildBody(size, context),
        ],
      ),
    );
  }

  Align buildPageHeader(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .125,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.arrow_back_ios_outlined),
              Text("Üye girişi"),
            ],
          ),
        ),
      ),
    );
  }

  Align buildBody(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * .75,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.instance.analysingIcon),
            SizedBox(
              height: size.height * .05,
            ),
            Text(
              "Cevaplarınız analiz ediliyor...",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }

  Column buildBackground(Size size, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(color: Theme.of(context).backgroundColor),
        ),
        Expanded(
          child: Container(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}
