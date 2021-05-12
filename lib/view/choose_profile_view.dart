import 'package:flutter/material.dart';

class ChooseProfileView extends StatefulWidget {
  @override
  _ChooseProfileViewState createState() => _ChooseProfileViewState();
}

class _ChooseProfileViewState extends State<ChooseProfileView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildPageFooter(size),
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
              Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
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
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileWidget(
                    icon: Icons.person,
                    name: 'Yaşar',
                    size: size,
                  ),
                  ProfileWidget(
                    icon: Icons.add,
                    name: 'Yeni Profil',
                    size: size,
                  ),
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

  Padding buildEditProfilesButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            Icons.edit,
            color: Theme.of(context).backgroundColor,
          ),
          Text("Profilleri Düzenle"),
        ],
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
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Size size;
  const ProfileWidget({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Theme.of(context).backgroundColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
          ),
          height: size.width / 4,
          width: size.width / 4,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Icon(
                icon,
                color: Colors.white,
                size: constraints.maxHeight - 16,
              );
            },
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(name,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey))
      ],
    );
  }
}
