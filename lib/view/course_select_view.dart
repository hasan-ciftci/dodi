import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class CourseSelectView extends StatefulWidget {
  const CourseSelectView({Key key}) : super(key: key);

  @override
  _CourseSelectViewState createState() => _CourseSelectViewState();
}

class _CourseSelectViewState extends State<CourseSelectView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          buildView(context, size),
          buildBottomNavigationBar(size),
        ],
      ),
    );
  }

  Container buildView(BuildContext context, Size size) {
    return Container(
      decoration: BoxDecoration(
        //Fill container curves with color
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).backgroundColor,
            Theme.of(context).primaryColor
          ],
          stops: [0.5, 0.5],
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildAppBar(context, size),
            buildCourses(size),
          ],
        ),
      ),
    );
  }

  Container buildCourses(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 150),
      padding: EdgeInsets.symmetric(vertical: 50.0),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  2,
                  (rowIndex) => buildCourseImage(columnIndex, rowIndex, size),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildAppBar(BuildContext context, Size size) {
    return Container(
      color: Theme.of(context).backgroundColor,
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
              "Ders Seçimi",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCourseImage(int columnIndex, int rowIndex, Size size) {
    return SizedBox(
      height: size.height * .30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Image.asset(
                ImageConstants.instance.getCourseImage(
                  (((columnIndex * 2) + (rowIndex))),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(courses[(columnIndex * 2) + rowIndex])
        ],
      ),
    );
  }

  Align buildBottomNavigationBar(Size size) {
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
            Icon(Icons.shopping_cart, color: Color(0xFFB0B0B0)),
            Icon(Icons.bar_chart, color: Color(0xFFB0B0B0)),
            Icon(Icons.home, color: Color(0xFFB0B0B0)),
            Column(
              children: [
                Icon(Icons.menu_book, color: Color(0xFFB0B0B0)),
                Text(
                  "Testler",
                  style: TextStyle(color: Color(0xFFB0B0B0)),
                ),
              ],
            ),
            Icon(Icons.person, color: Color(0xFFB0B0B0)),
          ],
        ),
      ),
    );
  }

  List<String> courses = [
    "Matematik",
    "Türkçe",
    "Hayat Bilgisi",
    "Zeka",
    "İngilizce",
    "Fen Bilimleri",
    "Genel Deneme Testleri",
    "Ödevler"
  ];
}
