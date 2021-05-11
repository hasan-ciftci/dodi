import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class ResultView extends StatefulWidget {
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildBody(size, context),
          buildAppBar(size, context)
        ],
      ),
    );
  }

  Align buildBody(Size size, BuildContext context) {
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
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * .09,
              left: size.width * .09,
              bottom: size.height * .1,
              top: size.height * .01,
            ),
            child: Column(
              children: [
                buildResultPoint(context),
                buildResultCaption(context),
                buildResultImage(),
                buildLine(),
                buildInformationText(context, size),
                buildButtons(size, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildResultPoint(BuildContext context) {
    return Text(
      "56",
      style: Theme.of(context).textTheme.headline1.copyWith(
          color: Theme.of(context).backgroundColor,
          fontWeight: FontWeight.w400),
    );
  }

  Text buildResultCaption(BuildContext context) {
    return Text("Orta Seviye Başarı",
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).backgroundColor,
            ));
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

  Padding buildInformationText(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Text(
        """
Sayın Velimiz,

Doç. Dr. Osman Abalı tarafından hazırlanan Görsel Algı ve Dikkat testi uygulamalarımızı tamamlamış bulunmaktayız.
Testlerin puanlaması ve değerlendirilmesi aşamasında çocuğunuzun Dikkat ve Görsel Algı performansına ilişkin bilgilere ve yorumlara yer vereceğiz. Bu değerlendirmeler yapacağımız çalışmalara da yön verecek.
Özellikle bilmeniz gereken nokta bu testin sonuçlarının TIBBİ TANILAMA AMACIYLA KULLANILMAMAKTA oluşudur.

Test puanları öğrencinin;

Genel dikkat düzeyi
Görsel algı performansı
Parça-bütün ilişkisini görebilme
Benzerlik ve farklılıkları ayırt edebilme
Sözel önermeleri doğru okuyabilme ve yorumlayabilme becerisi
Tablo-grafik yorumlama
örüntü ilişkilerini kavrayabilme gibi konulardaki performansının yorumlanmasına dayanak oluşturmaktadır.
                  """,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Padding buildButtons(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildGraphsButton(size, context),
          buildSuggestedProductsButton(size, context),
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
              Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
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

  Align buildAppBar(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Theme.of(context).bottomAppBarColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Color(0xFFB0B0B0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, color: Color(0xFFB0B0B0)),
                Text(
                  "Değerlendirme",
                  style: TextStyle(color: Color(0xFFB0B0B0)),
                ),
              ],
            ),
            Icon(Icons.home, color: Color(0xFFB0B0B0)),
            Icon(Icons.menu_book, color: Color(0xFFB0B0B0)),
            Icon(Icons.person, color: Color(0xFFB0B0B0)),
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

  SizedBox buildGraphsButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      child: Center(
        child: SizedBox(
          height: size.height * .08,
          width: size.width * .35,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Grafikler",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSuggestedProductsButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      child: Center(
        child: SizedBox(
          height: size.height * .08,
          width: size.width * .35,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Tavsiye Ürünler",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ),
        ),
      ),
    );
  }
}
