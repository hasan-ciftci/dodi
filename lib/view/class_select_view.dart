import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:dodi/view/subject_select_view.dart';
import 'package:dodi/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class ClassSelectView extends StatefulWidget {
  @override
  _ClassSelectViewState createState() => _ClassSelectViewState();
}

class _ClassSelectViewState extends State<ClassSelectView> {
  bool isSelected = false;
  int selectedClass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildBody(size, context),
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
              GestureDetector(
                onTap: ()=>Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Theme.of(context).backgroundColor,
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

  Flexible buildClassImage(int columnIndex, int rowIndex) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = true;
            selectedClass = (((columnIndex * 3) + (rowIndex))) + 1;
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return SubjectSelectView(grade: selectedClass);
              }));
            },
            child: Text(
              "$selectedClass. Sınıfı Seç",
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
