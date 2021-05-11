import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class EvaluationOverviewView extends StatefulWidget {
  @override
  _EvaluationOverviewViewState createState() => _EvaluationOverviewViewState();
}

class _EvaluationOverviewViewState extends State<EvaluationOverviewView> {
  List<Lecture> data = [
    Lecture(
      questionCount: 100,
      lectureName: 'Mat.',
      correctAnswerCount: 55,
      lectureColor: Colors.pinkAccent,
    ),
    Lecture(
      questionCount: 100,
      lectureName: 'H.Bilg.',
      correctAnswerCount: 45,
      lectureColor: Colors.blue,
    ),
    Lecture(
      questionCount: 100,
      lectureName: 'İng.',
      correctAnswerCount: 15,
      lectureColor: Colors.purple,
    ),
    Lecture(
      questionCount: 100,
      lectureName: 'Tr.',
      correctAnswerCount: 65,
      lectureColor: Colors.amber,
    ),
    Lecture(
      questionCount: 100,
      lectureName: 'Zeka',
      correctAnswerCount: 70,
      lectureColor: Colors.deepPurpleAccent,
    ),
    Lecture(
      questionCount: 100,
      lectureName: 'Fen.B.',
      correctAnswerCount: 22,
      lectureColor: Colors.green,
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                buildPageHeader(size),
                buildBody(size, context),
              ],
            ),
          ),
          buildBottomAppBar(size, context)
        ],
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

  buildBody(Size size, BuildContext context) {
    List<charts.Series<Lecture, String>> lectures = [
      charts.Series(
        id: "Lectures",
        data: data,
        domainFn: (Lecture lecture, _) => lecture.lectureName,
        measureFn: (Lecture lecture, _) => lecture.correctAnswerCount,
        colorFn: (Lecture lecture, _) =>
            charts.ColorUtil.fromDartColor(lecture.lectureColor),
      ),
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Body placed 87,5% height of screen with all attributes below
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * .08, horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Yaşar için Genel Görünüm",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Color(0xFF1C742C)),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: charts.BarChart(
                      lectures,
                      animate: true,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Indicator(
                                  color: Colors.pinkAccent,
                                  text: 'Matematik',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.pinkAccent,
                                ),
                                Indicator(
                                  color: Colors.blue,
                                  text: 'Hayat Bilgisi',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.blue,
                                ),
                                Indicator(
                                  color: Colors.purple,
                                  text: 'İngilizce',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.purple,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "%80",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16,
                                          color: Colors.pinkAccent),
                                ),
                                Text(
                                  "%60",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16, color: Colors.blue),
                                ),
                                Text(
                                  "%30",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.purple,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Indicator(
                                  color: Colors.amber,
                                  text: 'Türkçe',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.amber,
                                ),
                                Indicator(
                                  color: Colors.deepPurpleAccent,
                                  text: 'Zeka',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.deepPurpleAccent,
                                ),
                                Indicator(
                                  color: Colors.green,
                                  text: 'Fen Bilimleri',
                                  isSquare: false,
                                  size: 8,
                                  textColor: Colors.green,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "%68",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16, color: Colors.amber),
                                ),
                                Text(
                                  "%40",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16,
                                          color: Colors.deepPurpleAccent),
                                ),
                                Text(
                                  "%45",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16, color: Colors.green),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Derslerde Genel Başarı Yüzdesi",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Color(0xFF1C742C)),
                    ),
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.pinkAccent,
                    correctAnswerCount: 55,
                    questionCount: 100,
                    lectureName: 'Matematik',
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.blue,
                    correctAnswerCount: 50,
                    questionCount: 100,
                    lectureName: 'Hayat Bilgisi',
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.purple,
                    correctAnswerCount: 100,
                    questionCount: 100,
                    lectureName: 'İngilizce',
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.amber,
                    correctAnswerCount: 75,
                    questionCount: 100,
                    lectureName: 'Türkçe',
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.deepPurpleAccent,
                    correctAnswerCount: 75,
                    questionCount: 100,
                    lectureName: 'Zeka',
                  ),
                  LectureSuccessPercentageBar(
                    lectureColor: Colors.green,
                    correctAnswerCount: 30,
                    questionCount: 100,
                    lectureName: 'Fen Bilimleri',
                  ),
                  buildEarlierTestsButton(size, context)
                  //Social media buttons placed 10% height of screen
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align buildBottomAppBar(Size size, BuildContext context) {
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

  SizedBox buildEarlierTestsButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      child: Center(
        child: SizedBox(
          height: size.height * .08,
          width: size.width * .9,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Çözülmüş Testler",
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

class LectureSuccessPercentageBar extends StatefulWidget {
  final String lectureName;
  final int questionCount;
  final int correctAnswerCount;
  final Color lectureColor;

  const LectureSuccessPercentageBar({
    Key key,
    @required this.questionCount,
    @required this.correctAnswerCount,
    @required this.lectureColor,
    @required this.lectureName,
  }) : super(key: key);

  @override
  _LectureSuccessPercentageBarState createState() =>
      _LectureSuccessPercentageBarState();
}

class _LectureSuccessPercentageBarState
    extends State<LectureSuccessPercentageBar> {
  double correctAnswerPercentage;

  @override
  void initState() {
    super.initState();
    correctAnswerPercentage =
        (widget.correctAnswerCount / widget.questionCount) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.lectureName}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: widget.lectureColor),
              ),
              Text(
                correctAnswerPercentage % 1 == 0
                    ? "%${correctAnswerPercentage.toStringAsFixed(0)}"
                    : "%${correctAnswerPercentage.toStringAsFixed(1)}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: widget.lectureColor),
              ),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.grey.shade300,
                ),
              ),
              FractionallySizedBox(
                widthFactor: correctAnswerPercentage / 100,
                child: Container(
                  height: 5,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: widget.lectureColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            "${widget.questionCount} soruda ${widget.correctAnswerCount} doğru",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: widget.lectureColor),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 8,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color,
              ),
            ),
            Container(
              height: size / 3,
              width: size / 3,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

class Lecture {
  final String lectureName;
  final int questionCount;
  final int correctAnswerCount;
  final Color lectureColor;

  Lecture(
      {@required this.lectureName,
      @required this.questionCount,
      @required this.correctAnswerCount,
      @required this.lectureColor});
}