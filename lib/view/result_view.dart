import 'package:auto_size_text/auto_size_text.dart';
import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/image_constants.dart';

class ResultView extends StatefulWidget {
  final int grade;

  const ResultView({Key key, @required this.grade}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  AutoSizeGroup myGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size),
          SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                buildBody(size),
              ],
            ),
          ),
          buildPageHeader(size),
          buildBottomAppBar(size, context, SelectedPage.OVERVIEW),
        ],
      ),
    );
  }

  Align buildBody(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: size.height * .125),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            )),
        child: Padding(
          padding: EdgeInsets.only(
            right: size.width * .09,
            left: size.width * .09,
            bottom: size.height * .1,
            top: size.height * .01,
          ),
          child: Column(
            children: [
              buildResultPoint(),
              buildResultCaption(size),
              buildResultImage(),
              buildLine(),
              buildInformationText(size),
              buildComparisonGraph(),
              buildButtons(size),
            ],
          ),
        ),
      ),
    );
  }

  Image buildComparisonGraph() =>
      Image.asset(ImageConstants.instance.comparisonGraph);

  Text buildResultPoint() {
    return Text(
      "66",
      style: Theme.of(context).textTheme.headline1.copyWith(
          color: Theme.of(context).backgroundColor,
          fontWeight: FontWeight.w400),
    );
  }

  Column buildResultCaption(Size size) {
    return Column(
      children: [
        Text(
          "Orta Seviye Ba??ar??",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Theme.of(context).backgroundColor),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildScoreTable(context),
              SizedBox(
                width: 16,
              ),
              buildViewSolutionsButton(size, context),
            ],
          ),
        ),
      ],
    );
  }

  Column buildScoreTable(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.grade == 1 ? "2 do??ru" : "1 do??ru",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.green),
        ),
        Text(
          widget.grade == 1 ? "1 yanl????" : "2 yanl????",
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.red),
        ),
        Text(
          widget.grade == 1 ? "Bo?? yok" : "1 Bo??",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.amber),
        ),
      ],
    );
  }

  SizedBox buildViewSolutionsButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * .35,
      child: ElevatedButton(
        onPressed: () => widget.grade == 1
            ? Navigator.of(context).pushNamed("/solutionsView")
            : Navigator.of(context).pushNamed("/solutionsGradeTwelveView"),
        child: Text(
          "????z??mlere git",
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.button.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
      ),
    );
  }

  Padding buildResultImage() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Image.asset(ImageConstants.instance.result),
    );
  }

  Padding buildLine() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Image.asset(ImageConstants.instance.line),
    );
  }

  Padding buildInformationText(Size size) {
    String bulletPoint = "\u2022";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Text(
        """
Say??n Velimiz,

Testlerin puanlamas?? ve de??erlendirilmesi a??amas??nda ??ocu??unuzun Dikkat ve G??rsel Alg?? performans??na ili??kin bilgilere ve yorumlara yer verece??iz. Bu de??erlendirmeler yapaca????m??z ??al????malara da y??n verecek.
??zellikle bilmeniz gereken nokta bu testin sonu??lar??n??n TIBB?? TANILAMA AMACIYLA KULLANILMAMAKTA olu??udur.

Test puanlar?? ????rencinin;

$bulletPoint Genel dikkat d??zeyi
$bulletPoint G??rsel alg?? performans??
$bulletPoint Par??a-b??t??n ili??kisini g??rebilme
$bulletPoint Benzerlik ve farkl??l??klar?? ay??rt edebilme
$bulletPoint S??zel ??nermeleri do??ru okuyabilme ve yorumlayabilme becerisi
$bulletPoint Tablo-grafik yorumlama
??r??nt?? ili??kilerini kavrayabilme gibi konulardaki performans??n??n yorumlanmas??na dayanak olu??turmaktad??r.
                  """,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Padding buildButtons(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: size.height * .15,
              child: buildGeneralStatisticsButton(size, context)),
          SizedBox(
              height: size.height * .15,
              child: buildSuggestedProductsButton(size, context)),
        ],
      ),
    );
  }

  Align buildPageHeader(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .125,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildBackground(Size size) {
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

  Center buildGeneralStatisticsButton(Size size, BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.height * .08,
        width: size.width * .35,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/evaluationOverview");
          },
          child: AutoSizeText(
            "Genel ??statistikler",
            group: myGroup,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
          ),
        ),
      ),
    );
  }

  Center buildSuggestedProductsButton(Size size, BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.height * .08,
        width: size.width * .35,
        child: ElevatedButton(
          onPressed: () {},
          child: AutoSizeText(
            "Sana Uygun ??r??nler",
            overflowReplacement: AutoSizeText(
              '??r??nler',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
              group: myGroup,
            ),
            group: myGroup,
            maxLines: 2,
            minFontSize: 10.sp,
            stepGranularity: 5.sp,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
          ),
        ),
      ),
    );
  }
}
