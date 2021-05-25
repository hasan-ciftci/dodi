import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/test_introduction_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class SubjectSelectView extends StatefulWidget {
  final int grade;

  const SubjectSelectView({Key key, this.grade}) : super(key: key);

  @override
  _SubjectSelectViewState createState() => _SubjectSelectViewState();
}

class _SubjectSelectViewState extends State<SubjectSelectView> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),

          buildBody(size, context),
          buildPageHeader(size),
          buildBottomAppBar(size,context,SelectedPage.TESTS)
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * .03),
              child: SizedBox(
                height: size.height * .1,
                width: size.width * .9,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).backgroundColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    suffixIcon: Icon(Icons.search,
                        color: Theme.of(context).backgroundColor),
                    prefixIcon:
                        Icon(Icons.mic, color: Theme.of(context).primaryColor),
                    labelText: "Ne arıyorsun?",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TestIntroductionView(grade: widget.grade,),
                      ),
                    ),
                    child: Text(
                      subjects[index],
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: subjects.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 32.0, vertical: size.height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Son Testler",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Temizle",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .15,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: List.generate(
                      lastQuizzes.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: CourseCard(
                          courseImageIndex: index,
                          size: size,
                          courseName: lastQuizzes[index],
                          courseColor: courseColors[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
              GestureDetector(
                onTap: ()=>Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
              Text("Konu Seçimi",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
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

  List<String> subjects = [
    "Temel Yetenek Testi (5-7 Yaş)",
    "Peabody Resim Kelime Testi",
    "Frostig Gelişimsel Görsel Algı Testi",
    "Metropolitan Okul Olgunluğu Testi",
    "Moxo Dikkat Testi",
    "D2 Dikkat Testi",
    "Görsel Algı ve Dikkat Testi",
    "Torrance Yaratıcı Düşünme Testi",
    "Çizgi Yönünü Belirleme Testi"
  ];

  List<String> lastQuizzes = [
    "Zeka ve Bilişsel Değerlendirme Testi\n%75",
    "Yetenek Testi\n%30",
    "Gelişim Değerlendirme ve Ölçme Testi\n%80",
    "Okula Hazırlık Testi\n%55",
  ];
  List<Color> courseColors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.teal,
    Colors.lightBlueAccent,
    Colors.pinkAccent,
    Colors.orange,
  ];
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final Color courseColor;
  final int courseImageIndex;
  final Size size;

  const CourseCard(
      {Key key,
      @required this.courseName,
      @required this.courseColor,
      @required this.size,
      @required this.courseImageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: size.height * .15,
          width: size.height * .1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImageConstants.instance.getLastQuizzImage(courseImageIndex),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
            width: size.height * .1,
            child: Container(
              decoration: BoxDecoration(
                  color: courseColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                  child: Text(
                    courseName,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
