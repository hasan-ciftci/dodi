import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/constants/image_constants.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  int instantValueOfTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animation.addListener(() {
      instantValueOfTabController = _tabController.animation.value.round();
      if (instantValueOfTabController != _currentIndex)
        setState(() {
          _currentIndex = (_tabController.animation.value).round();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              buildBody(size, context, 1),
              buildBody(size, context, 2),
              buildBody(size, context, 3),
            ],
          ),
          buildPageFooter(size, _currentIndex),
        ],
      ),
    );
  }

  Align buildBody(Size size, BuildContext context, int index) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .75,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Color(0xFFE9F0D0),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * .1),
            SizedBox(
              height: size.height * .35,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: buildIntroductionImage(index)),
            ),
            SizedBox(height: size.height * .05),
            SizedBox(
              height: size.height * .15,
              child: buildIntroductionText(size, context),
            ),
            SizedBox(height: size.height * .1),
          ],
        ),
      ),
    );
  }

  Image buildIntroductionImage(int index) => index == 1
      ? Image.asset(ImageConstants.instance.introduction1)
      : index == 2
          ? Image.asset(ImageConstants.instance.introduction2)
          : Image.asset(ImageConstants.instance.introduction3);

  Center buildIntroductionText(Size size, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .1),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Align buildPageFooter(Size size, int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildPageIndicators(size, index),
            buildNextButton(size),
          ],
        ),
      ),
    );
  }

  Center buildPageIndicators(Size size, int index) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0 ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 1 ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 2 ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
      ],
    ));
  }

  GestureDetector buildNextButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/loginView');
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(size.width * .1),
          child: Text(
            "Geç",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
