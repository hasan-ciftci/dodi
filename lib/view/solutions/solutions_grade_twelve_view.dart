import 'package:dodi/core/enums/selected_option_enum.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../finish_test_screen.dart';

class SolutionsGradeTwelveView extends StatefulWidget {
  @override
  _SolutionsGradeTwelveViewState createState() =>
      _SolutionsGradeTwelveViewState();
}

class _SolutionsGradeTwelveViewState extends State<SolutionsGradeTwelveView>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  int instantValueOfTabController;
  List<SelectedOption> selectedAnswers;
  List<QuestionModel> questions;
  bool solutionShowing = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    _tabController.animation.addListener(() {
      instantValueOfTabController = _tabController.animation.value.round();
      if (instantValueOfTabController != _currentIndex)
        setState(() {
          _currentIndex = (_tabController.animation.value).round();
        });
    });
    selectedAnswers = [
      SelectedOption.EMPTY,
      SelectedOption.EMPTY,
      SelectedOption.EMPTY,
      SelectedOption.EMPTY
    ];
    questions = [
      QuestionModel(
        questionImage: ImageConstants.instance.soru1_12,
        optionAText: "2 / 3",
        optionBText: "3 / 4",
        optionCText: "4 / 5",
        optionDText: "1",
        optionEText: "5 / 4",
      ),
      QuestionModel(
        questionText:
            "Otuz Yıl Savaşları sonucunda Katolik müttefikler ile Protestanlar arasında Westphalia Barışı imzalanmıştır.",
        boldQuestionText:
            "Aşağıdakilerden hangisi Westphalia Antlaşması'nınsonuçlarından biri değildir?",
        optionAText: "Avrupa halkına mezhep seçme özgürlüğünün tanınması",
        optionBText:
            "Protestanlığı ortadan kaldırmaya yönelik çalışmaların son bulması",
        optionCText:
            "Hollanda, İsviçre ve Portekiz gibi devletlerin bağımsızlığının kabul görmesi",
        optionDText: "Almanya'nın siyasal birliğini tamamlaması",
        optionEText: "Modern devletler hukukunun temelinin atılması",
      ),
      QuestionModel(
        questionImage: ImageConstants.instance.soru3_12,
        optionAText: "2 / 3",
        optionBText: "3 / 4",
        optionCText: "4 / 5",
        optionDText: "1",
        optionEText: "5 / 4",
      ),
      QuestionModel(
        questionText: "Ömer Seyfettin, Sait Faik Abasıyanık, Memduh Şevket"
            "Esendal, Refik Halit Karay, Sabahattin Ali hikâyenin Türk edebiyatında bir edebî tür olarak yerleşmesinde yoğun"
            "emek sarf etmişlerdir. Bugün geldiğimiz noktada “hikâye"
            "anlatma” tarzında klasik yapıda öyküler yazmaya devam"
            "eden yazarlar olduğu gibi, daha çok ima yoluyla anlatan,"
            "  imgesel bir dil kullanarak daha kısa metinler kuran yani"
            "küçürek hikâyeler yazanlar da vardır. Küçürek hikâye yazarları, sıradan fakat yoğun ve özgün yaşantıları bu yollarla bize anlatırlar. Bu tür hikâyeler nasihatte bulunmaz, karakter geliştirmez, okuyucuyu bir yere taşımaz ancak bazı değişmez hakikatleri sezdirir, insanları onlarla aniden yüzleştirerek şok uyarmalar yapar.",
        boldQuestionText:
            "Bu açıklamaya göre aşağıdaki parçaların hangisi küçürek bir hikâyeden alınmış olabilir?",
        optionAText:
            "Birkaç hafta önce, her sabahki gibi, kahvemi içerek gazeteleri gözden geçiriyordum. Puslu, bungun bir haziran sabahıydı.",
        optionBText:
            "Kaç kardeştik bilmiyorum. En küçük bendim ve henüz saymayı bilmiyordum. Öğrendiğimde ise hepimiz dağılmıştık.",
        optionCText:
            "Evin her yanı yeni ovulmuş pirinç kaplar gibi pınl pırıl. Su kapları dolu. Gaz tüpleri dolu. Artık kafasının takılıp kalacağı tek nokta yok.",
        optionDText:
            "Oğlum Musa da erliğini İstanbul’da yaptıydı. Bura delikanlısının erliği de, sivilliği de hep deniz üzredir. Denizi daha bebeyken biliverirler.",
        optionEText:
            "Ülkenin büyük şehirlere uzak bir dağ başı kasabasında, bir demiryolu istasyonunda çalışan üç hikâyeciydik. İstasyon binasına bitişik yan yana üç kulübemiz vardı.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          buildBackground(size, context),
          TabBarView(controller: _tabController, children: [
            ...List.generate(
              questions.length,
              (index) => TabItem(
                size: size,
                child: buildQuestionCard(
                  size: size,
                  index: index,
                  questionModel: questions[index],
                ),
              ),
            ),
            FinishTestView(
              grade: 12,
              isSolutionReview: true,
            ),
          ]),
          AnimatedPositioned(
            top: solutionShowing ? 0 : -(size.height * .6),
            curve: Curves.easeInOutSine,
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(top: size.height * .14),
              padding: EdgeInsets.all(24),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(ImageConstants.instance.video),
                  Spacer(),
                  Text(
                    "1. Sınıflar için Görsel Algı ve Dikkat Testi Soru Çözüm Videosu",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Color(0xFF737373)),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          buildPageHeader(size, _tabController),
          buildNextButton(size),
        ],
      ),
    );
  }

  buildQuestionCard(
      {@required Size size,
      @required int index,
      @required QuestionModel questionModel}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                if (questionModel.questionImage != null)
                  Image.asset(questionModel.questionImage),
                if (questionModel.boldQuestionText == null)
                  SizedBox(height: 16),
                if (questionModel.questionText != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      questionModel.questionText ?? "",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                if (questionModel.boldQuestionText != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      questionModel.boldQuestionText ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                (index == 0 || index == 2)
                    ? buildShortOptions(size, index, questionModel)
                    : buildLongOptions(size, index, questionModel)
              ],
            ),
          ),
        ),
        index == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Doğru Cevap Verildi",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.green),
                  ),
                ),
              )
            : index == 1 || index == 2
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Yanlış Cevap Verildi",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Boş Bırakıldı",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.orange),
                      ),
                    ),
                  ),
      ],
    );
  }

  Column buildShortOptions(Size size, int index, QuestionModel questionModel) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                width: size.width / 3,
                child: buildOption(
                    selectedOption: SelectedOption.A,
                    size: size,
                    index: index,
                    image: questionModel.optionAImage,
                    text: questionModel.optionAText),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: size.width / 3,
                child: buildOption(
                    selectedOption: SelectedOption.B,
                    size: size,
                    index: index,
                    image: questionModel.optionBImage,
                    text: questionModel.optionBText),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                width: size.width / 3,
                child: buildOption(
                    selectedOption: SelectedOption.C,
                    size: size,
                    index: index,
                    image: questionModel.optionCImage,
                    text: questionModel.optionCText),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: size.width / 3,
                child: buildOption(
                    selectedOption: SelectedOption.D,
                    size: size,
                    index: index,
                    image: questionModel.optionDImage,
                    text: questionModel.optionDText),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: size.width / 3,
          child: buildOption(
              selectedOption: SelectedOption.E,
              size: size,
              index: index,
              image: questionModel.optionEImage,
              text: questionModel.optionEText),
        ),
      ],
    );
  }

  Column buildLongOptions(Size size, int index, QuestionModel questionModel) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: buildOption(
              selectedOption: SelectedOption.A,
              size: size,
              index: index,
              image: questionModel.optionAImage,
              text: questionModel.optionAText),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildOption(
              selectedOption: SelectedOption.B,
              size: size,
              index: index,
              image: questionModel.optionBImage,
              text: questionModel.optionBText),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildOption(
              selectedOption: SelectedOption.C,
              size: size,
              index: index,
              image: questionModel.optionCImage,
              text: questionModel.optionCText),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildOption(
              selectedOption: SelectedOption.D,
              size: size,
              index: index,
              image: questionModel.optionDImage,
              text: questionModel.optionDText),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildOption(
              selectedOption: SelectedOption.E,
              size: size,
              index: index,
              image: questionModel.optionEImage,
              text: questionModel.optionEText),
        ),
      ],
    );
  }

  buildOption(
      {Size size,
      SelectedOption selectedOption,
      int index,
      String image,
      String text}) {
    Color getColor() {
      if ((index == 0 && selectedOption == SelectedOption.E) ||
          (index == 1 && selectedOption == SelectedOption.D) ||
          (index == 2 && selectedOption == SelectedOption.D)) {
        return Colors.green;
      }
      if (index == 1 && selectedOption == SelectedOption.B ||
          index == 2 && selectedOption == SelectedOption.C) {
        return Colors.red;
      }
      if ((index == 3 && selectedOption == SelectedOption.B)) {
        return Colors.orange;
      } else {
        return Colors.grey;
      }
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswers[index] = selectedOption;
        });
      },
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: getColor(), width: 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                selectedOption.optionTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold, color: getColor()),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null) Center(child: Image.asset(image)),
                  Text(
                    text ?? "Seçenek yüklenemedi",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Align buildPageHeader(Size size, TabController tabController) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .14,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            solutionShowing = !solutionShowing;
                          });
                        },
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 250),
                          opacity: _currentIndex == _tabController.length - 1
                              ? 0
                              : 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * .05,
                                width: size.height * .05,
                                child: Image.asset(solutionShowing
                                    ? ImageConstants.instance.camera_off
                                    : ImageConstants.instance.camera),
                              ),
                              Text(
                                  solutionShowing
                                      ? "Çözümü Kapat"
                                      : "Çözümü İzle",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        )),
                    Text(
                      "12. sınıf",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .01,
                      color: Theme.of(context).disabledColor,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: size.width *
                          (_currentIndex + 1) /
                          (tabController.length - 1),
                      height: size.height * .01,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity buildNextButton(Size size) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 250),
      opacity: _currentIndex == _tabController.length - 1 ? 0 : 1,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: size.height * .125,
          child: Center(
            child: SizedBox(
              height: size.height * .08,
              width: size.width * .9,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _tabController.length - 1)
                    _tabController.animateTo(_currentIndex + 1,
                        duration: Duration(), curve: Curves.easeInOut);
                },
                child: Text(
                  "İleri",
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
}

class QuestionModel {
  final String questionText;
  final String boldQuestionText;
  final String questionImage;
  final String optionAImage;
  final String optionBImage;
  final String optionCImage;
  final String optionDImage;
  final String optionEImage;
  final String optionText;
  final String optionAText;
  final String optionBText;
  final String optionCText;
  final String optionDText;
  final String optionEText;

  QuestionModel(
      {this.boldQuestionText,
      this.optionDImage,
      this.optionEImage,
      this.optionDText,
      this.optionEText,
      this.optionText,
      this.optionAText,
      this.optionBText,
      this.optionCText,
      this.questionText,
      this.questionImage,
      this.optionAImage,
      this.optionBImage,
      this.optionCImage});
}

class TabItem extends StatelessWidget {
  final Widget child;

  const TabItem({
    Key key,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: size.height * .14),
        height: size.height * .73,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
