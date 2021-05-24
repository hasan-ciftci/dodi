import 'package:dodi/view/quiz/quiz_grade_one_view.dart';
import 'package:dodi/view/quiz/quiz_grade_twelve_view.dart';
import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';
import 'course_select_view.dart';

class NewClassSelectView extends StatefulWidget {
  @override
  _NewClassSelectViewState createState() => _NewClassSelectViewState();
}

class _NewClassSelectViewState extends State<NewClassSelectView> {
  bool isSelected = false;
  double sliderValue = 0.0;
  ScrollController scrollController = ScrollController();

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
            Spacer(),
            SizedBox(
              height: size.width * .5,
              width: size.width * .5,
              child: buildCurrentGrade(size),
            ),
            Spacer(),
            buildSlider(context, size),
            Spacer(),
            SizedBox(
              height: size.height * .08,
              width: size.width * .9,
              child: buildSelectClassButton(context),
            ),
            SizedBox(height: size.width * .08)
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSelectClassButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        int selectedClass = ((sliderValue * 11) + 1).round();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseSelectView(grade: selectedClass,),
          ),
        );
      },
      child: Text("Sınıfı Seç",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }

  SliderTheme buildSlider(BuildContext context, Size size) {
    return SliderTheme(
      data: SliderThemeData(
        activeTickMarkColor: Theme.of(context).backgroundColor,
        disabledActiveTickMarkColor: Colors.purple,
        disabledInactiveTickMarkColor: Colors.green,
        inactiveTickMarkColor: Colors.grey,
        activeTrackColor: Theme.of(context).backgroundColor,
        inactiveTrackColor: Colors.grey,
        thumbColor: Theme.of(context).backgroundColor,
        overlayColor: Theme.of(context).backgroundColor.withOpacity(.1),
      ),
      child: SizedBox(
        width: size.width * .7,
        child: Slider(
          divisions: 11,
          value: sliderValue,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
              scrollController.animateTo(((value * (size.width * .5 * 11))),
                  curve: Curves.fastOutSlowIn, duration: Duration(seconds: 1));
            });
          },
        ),
      ),
    );
  }

  ListView buildCurrentGrade(Size size) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: scrollController,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) => SizedBox(
          height: size.width * .5,
          width: size.width * .5,
          child: Image.asset(ImageConstants.instance.getNewClassImage(index))),
      itemCount: 12,
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
              Text("Sınıf Seçimi",
                  style: TextStyle(
                    color: Colors.white,
                  )),
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
            Icon(Icons.bar_chart, color: Color(0xFFB0B0B0)),
            Icon(Icons.home, color: Color(0xFFB0B0B0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
