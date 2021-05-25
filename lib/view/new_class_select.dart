import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/quiz/quiz_grade_one_view.dart';
import 'package:dodi/view/quiz/quiz_grade_twelve_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
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
            builder: (_) => CourseSelectView(
              grade: selectedClass,
            ),
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
        activeTickMarkColor: Theme.of(context).primaryColorLight,
        inactiveTickMarkColor: Colors.grey,
        activeTrackColor: Theme.of(context).primaryColorLight,
        inactiveTrackColor: Colors.grey,
        thumbColor: Theme.of(context).primaryColorLight,
        overlayColor: Theme.of(context).primaryColorLight.withOpacity(.1),
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
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
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
