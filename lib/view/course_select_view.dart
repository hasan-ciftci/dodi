import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/subject_select_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class CourseSelectView extends StatefulWidget {
  final int grade;

  const CourseSelectView({Key key, @required this.grade}) : super(key: key);

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
          buildBottomAppBar(size,context,SelectedPage.TESTS)
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
            GestureDetector(
              onTap: ()=>Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubjectSelectView(
                      grade: widget.grade,
                    ),
                  ),
                );
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
