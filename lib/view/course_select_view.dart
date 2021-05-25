import 'package:auto_size_text/auto_size_text.dart';
import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/subject_select_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseSelectView extends StatefulWidget {
  final int grade;

  const CourseSelectView({Key key, @required this.grade}) : super(key: key);

  @override
  _CourseSelectViewState createState() => _CourseSelectViewState();
}

class _CourseSelectViewState extends State<CourseSelectView> {
  AutoSizeGroup courseNames = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          buildView(context, size),
          buildBottomAppBar(size, context, SelectedPage.TESTS),
          buildAppBar(context, size),
        ],
      ),
    );
  }

  Container buildView(BuildContext context, Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * .125),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              onTap: () => Navigator.of(context).pop(),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.width * .4,
        width: size.width * .4,
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
            SizedBox(height: 8.h),
            SizedBox(
              width: size.width * .4,
              child: AutoSizeText(
                courses[(columnIndex * 2) + rowIndex],
                group: courseNames,
                maxLines: 2,
                minFontSize: 10.sp,
                stepGranularity: 5.sp,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color(0xFF737373)),
              ),
            ),
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
