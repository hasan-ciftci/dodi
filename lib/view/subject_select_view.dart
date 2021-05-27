import 'dart:math';

import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/test_introduction_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../core/constants/image_constants.dart';

class SubjectSelectView extends StatefulWidget {
  final int grade;

  const SubjectSelectView({Key key, this.grade}) : super(key: key);

  @override
  _SubjectSelectViewState createState() => _SubjectSelectViewState();
}

class _SubjectSelectViewState extends State<SubjectSelectView> {
  TextEditingController searchController = TextEditingController();
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = 'tr_TR';
  int resultListened = 0;
  bool hasSpeech = false;
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildBody(size, context),
          buildPageHeader(size),
          buildBottomAppBar(size, context, SelectedPage.TESTS)
        ],
      ),
    );
  }

  Align buildBody(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        reverse: true,
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
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 50.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).backgroundColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          suffixIcon: Icon(Icons.search,
                              color: Theme.of(context).primaryColorLight),
                          labelText: speech.isListening
                              ? "Dinleniyor..."
                              : "Ne arıyorsun?",
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: hasSpeech ? 1 : 0,
                        duration: Duration(seconds: 1),
                        child: IconButton(
                          icon: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: .26,
                                      spreadRadius: level * 1.5,
                                      color: Colors.black.withOpacity(.05))
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Icon(Icons.mic,
                                color: Theme.of(context).primaryColorLight),
                          ),
                          onPressed: !_hasSpeech || speech.isListening
                              ? null
                              : startListening,
                        ),
                      ),
                    ],
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
                          builder: (_) => TestIntroductionView(
                            grade: widget.grade,
                          ),
                        ),
                      ),
                      child: subjects[index]
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())
                          ? Text(
                              subjects[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontWeight: FontWeight.w300),
                            )
                          : SizedBox(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      subjects[index]
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())
                          ? Divider()
                          : SizedBox(),
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

  void requestPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.microphone]);
    }
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords}';
      searchController.text = lastWords;
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    print(
        'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  Future<void> initSpeechState() async {
    requestPermission();
    hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
        finalTimeout: Duration(milliseconds: 0));
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }
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
