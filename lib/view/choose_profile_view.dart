import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/widget/profile_widget.dart';
import 'package:flutter/material.dart';

class ChooseProfileView extends StatefulWidget {
  @override
  _ChooseProfileViewState createState() => _ChooseProfileViewState();
}

class _ChooseProfileViewState extends State<ChooseProfileView> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageFooter(size),
          buildPageHeader(size),
          buildProfiles(size, context),
        ],
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
              Text(
                "Profil",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align buildProfiles(Size size, BuildContext context) {
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Center(
                child: SingleChildScrollView(
                  child: buildBottomSheetActions(
                      profiles: [1], size: size, crossAxisLength: 2),
                ),
              )),
              buildEditProfilesButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheetActions(
      {@required int crossAxisLength,
      @required List<dynamic> profiles,
      Size size}) {
    if (profiles.length == 0) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/createProfile");
        },
        child: ProfileWidget(
          icon: Icons.add,
          name: 'Yeni Ekle',
          size: size,
        ),
      );
    } else {
      return Column(
        children: List.generate(
          ((profiles.length / crossAxisLength) + 1).floor(),
          (columnIndex) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              crossAxisLength,
              (rowIndex) => columnIndex * crossAxisLength + rowIndex ==
                      profiles.length
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/createProfile");
                      },
                      child: ProfileWidget(
                        icon: Icons.add,
                        name: 'Yeni Ekle',
                        size: size,
                      ),
                    )
                  : columnIndex * crossAxisLength + rowIndex > profiles.length
                      ? Container(
                          child: Text((columnIndex).toString()),
                          margin: EdgeInsets.all(8.0),
                          color: Colors.green,
                          height: size.width / 4,
                          width: size.width / 4,
                        )
                      : ProfileWidget(
                          isEditing: editMode,
                          icon: Icons.person,
                          name: 'Yaşar',
                          size: size,
                        ),
            ),
          ),
        ),
      );
    }
  }

  GestureDetector buildEditProfilesButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleEditMode();
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              Image.asset(ImageConstants.instance.penVectorOrange),
              SizedBox(height: 4),
              Text(
                "Profilleri Düzenle",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Theme.of(context).disabledColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align buildPageFooter(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        height: size.height * .125,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/register');
          },
          child: Text(
            "Bir profil seç ya da yarat.",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Colors.white),
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

  void toggleEditMode() {
    setState(() {
      editMode = !editMode;
    });
  }
}
