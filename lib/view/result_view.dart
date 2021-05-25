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
          buildBody(size),
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
        height: size.height * .85,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            )),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
      ),
    );
  }

  Image buildComparisonGraph() =>
      Image.asset(ImageConstants.instance.comparisonGraph);

  Text buildResultPoint() {
    return Text(
      "56",
      style: Theme.of(context).textTheme.headline1.copyWith(
          color: Theme.of(context).backgroundColor,
          fontWeight: FontWeight.w400),
    );
  }

  Column buildResultCaption(Size size) {
    return Column(
      children: [
        Text(
          "Orta Seviye Başarı",
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
          widget.grade == 1 ? "2 doğru" : "1 doğru",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.green),
        ),
        Text(
          widget.grade == 1 ? "1 yanlış" : "2 yanlış",
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.red),
        ),
        Text(
          widget.grade == 1 ? "Boş yok" : "1 Boş",
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
          "Çözümlere git",
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
Sayın Velimiz,

Testlerin puanlaması ve değerlendirilmesi aşamasında çocuğunuzun Dikkat ve Görsel Algı performansına ilişkin bilgilere ve yorumlara yer vereceğiz. Bu değerlendirmeler yapacağımız çalışmalara da yön verecek.
Özellikle bilmeniz gereken nokta bu testin sonuçlarının TIBBİ TANILAMA AMACIYLA KULLANILMAMAKTA oluşudur.

Test puanları öğrencinin;

$bulletPoint Genel dikkat düzeyi
$bulletPoint Görsel algı performansı
$bulletPoint Parça-bütün ilişkisini görebilme
$bulletPoint Benzerlik ve farklılıkları ayırt edebilme
$bulletPoint Sözel önermeleri doğru okuyabilme ve yorumlayabilme becerisi
$bulletPoint Tablo-grafik yorumlama
örüntü ilişkilerini kavrayabilme gibi konulardaki performansının yorumlanmasına dayanak oluşturmaktadır.
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
              Text(
                "Değerlendirme Tablosu",
                style: TextStyle(color: Colors.white),
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
            "Genel İstatistikler",
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
            "Sana Uygun Ürünler",
            overflowReplacement: AutoSizeText(
              'Ürünler',
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
