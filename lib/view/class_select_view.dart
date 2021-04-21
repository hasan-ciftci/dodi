import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class ClassSelectView extends StatefulWidget {
  @override
  _ClassSelectViewState createState() => _ClassSelectViewState();
}

class _ClassSelectViewState extends State<ClassSelectView> {
  bool isSelected = false;
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
      alignment: Alignment.center,
      child: Container(
        height: size.height * .75,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ...List.generate(
              4,
              (columnIndex) => SizedBox(
                height: size.height * .15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (rowIndex) => buildClassImage(columnIndex, rowIndex),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: buildSelectClassButton(size, context))
          ],
        ),
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
              Text("Sınıf Seçimi"),
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
            Icon(Icons.shopping_cart),
            Icon(Icons.bar_chart),
            Icon(Icons.home),
            Icon(Icons.menu_book),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  Container buildBackground(Size size, BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [
            Theme.of(context).backgroundColor,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
    );
  }

  Flexible buildClassImage(int columnIndex, int rowIndex) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = true;
          });
        },
        child: Image.asset(
          ImageConstants.instance.getClassImage(
            (((columnIndex * 3) + (rowIndex))),
          ),
        ),
      ),
    );
  }

  SizedBox buildSelectClassButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      child: Center(
        child: SizedBox(
          height: size.height * .08,
          width: size.width * .9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/startTest');
            },
            child: Text(
              "1. Sınıfı Seç",
              style: Theme.of(context).textTheme.headline5,
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
