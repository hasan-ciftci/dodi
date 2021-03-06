import 'package:auto_size_text/auto_size_text.dart';
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

  List<String> introductionTexts;
  List<String> introductionImages;

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

    introductionTexts = [
      introductionPage1Text,
      introductionPage2Text,
      introductionPage3Text
    ];
    introductionImages = [
      introductionPage1Image,
      introductionPage2Image,
      introductionPage3Image
    ];
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
              buildBody(size: size, page: 1),
              buildBody(size: size, page: 2),
              buildBody(size: size, page: 3),
            ],
          ),
          buildPageFooter(size, _currentIndex),
        ],
      ),
    );
  }

  Align buildBody({Size size, int page}) {
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
          color: Theme.of(context).bottomAppBarColor,
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * .1),
            SizedBox(
              height: size.height * .35,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: buildIntroductionImage(page)),
            ),
            SizedBox(height: size.height * .05),
            SizedBox(
              height: size.height * .15,
              child: buildIntroductionText(page, size),
            ),
            SizedBox(height: size.height * .1),
          ],
        ),
      ),
    );
  }

  Image buildIntroductionImage(int page) =>
      Image.asset(introductionImages[page - 1]);

  Center buildIntroductionText(int page, Size size) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          child: AutoSizeText(
            introductionTexts[page - 1],
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
      );

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
            "Ge??",
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

  String introductionPage1Text =
      "Dijital Sorum, interaktif bir soru bankas?? uygulamas??d??r. Veli ve ????renci i??in performans ve verim odakl?? ??zellikler sunar.";
  String introductionPage2Text =
      "Veli, kendine ??zel profil olu??turup ayn?? hesaba tan??ml?? ????rencilerinin performans grafi??ini, ????zm???? oldu??u testleri ve etkinliklerini izleyebilir. ";
  String introductionPage3Text =
      "????renci, ders ve konu ba??l??klar??na g??re filtrelenmi?? testleri kolayl??kla bulup, testi tamamlad??ktan sonra video ????z??mlerini izleyebilir ve de??erlendirme notlar??n?? inceleyebilir. Dijital Sorum, soru banklar??n?? cebinize s????d??r??r.";

  String introductionPage1Image = ImageConstants.instance.introduction1;
  String introductionPage2Image = ImageConstants.instance.introduction2;
  String introductionPage3Image = ImageConstants.instance.introduction3;
}
