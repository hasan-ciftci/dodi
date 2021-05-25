import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/widget/profile_widget.dart';
import 'package:flutter/material.dart';

import 'create_profile_extra.dart';

class ChooseProfileExtra extends StatefulWidget {
  @override
  _ChooseProfileExtraState createState() => _ChooseProfileExtraState();
}

class _ChooseProfileExtraState extends State<ChooseProfileExtra> {
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
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (editMode == true)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateProfileExtra(
                              isStudent: true,
                              lastName: "Yaşar",
                              name: 'Kemal',
                            ),
                          ),
                        );
                      else {
                        Navigator.of(context).pushNamed("/newClassSelectView");
                      }
                    },
                    child: ProfileWidget(
                      isEditing: editMode,
                      icon: Icons.person,
                      name: 'Yaşar',
                      size: size,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (editMode == true)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateProfileExtra(
                              isStudent: false,
                              lastName: "Ayşe",
                              name: 'Kemal',
                            ),
                          ),
                        );
                      else {
                        Navigator.of(context).pushNamed("/newClassSelectView");
                      }
                    },
                    child: ProfileWidget(
                      image: ImageConstants.instance.profile,
                      isEditing: editMode,
                      icon: Icons.person,
                      name: 'Ayşe',
                      size: size,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("hasan");
                      Navigator.of(context).pushNamed("/createProfile");
                    },
                    child: ProfileWidget(
                      icon: Icons.add,
                      name: 'Yeni Profil',
                      size: size,
                    ),
                  ),
                  SizedBox(
                    height: size.width / 4 + 16,
                    width: size.width / 4 + 16,
                  )
                ],
              ),
              Spacer(),
              buildEditProfilesButton(context),
            ],
          ),
        ),
      ),
    );
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
              Image.asset(ImageConstants.instance.penVectorOrange,color: Theme.of(context).backgroundColor,),
              SizedBox(height: 4),
              Text("Profilleri Düzenle"),
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
