import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildSignUpForm(size, context),
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
                "Kayıt ol",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align buildSignUpForm(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: size.height * .875,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
            color: Colors.white,
          ),
          child: SizedBox(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Body placed 87,5% height of screen with all attributes below
                  Column(
                    children: [
                      //Social media buttons placed 10% height of screen
                      SizedBox(
                        height: size.height * .1,
                        child: buildSocialMediaButtons(size),
                      ),
                      //Form fields placed 50% height of screen
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * .1,
                            width: size.width * .9,
                            child: buildNameTextFormField(),
                          ),
                          SizedBox(
                            height: size.height * .1,
                            width: size.width * .9,
                            child: buildSurnameTextFormField(),
                          ),
                          SizedBox(
                            height: size.height * .1,
                            width: size.width * .9,
                            child: buildEmailTextFormField(),
                          ),
                          SizedBox(
                            height: size.height * .1,
                            width: size.width * .9,
                            child: buildPasswordTextFormField(),
                          ),
                          SizedBox(
                            height: size.height * .1,
                            width: size.width * .9,
                            child: buildVerifyPasswordTextFormField(),
                          ),
                        ],
                      ),
                      //Register and radio buttons placed 27.5% height of screen
                      SizedBox(
                          height: size.height * .275,
                          width: size.width * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildPrivacyPolicyRadioButton(),
                              buildDeclarationOfConsentRadioButton(),
                              buildLoginButton(size, context),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildPrivacyPolicyRadioButton() {
    return Row(
      children: [
        Radio(
          onChanged: (value) {},
          value: 1,
          groupValue: 0,
        ),
        Text(
          "Gizlilik politikasını okudum onaylıyorum.",
          textAlign: TextAlign.end,
        )
      ],
    );
  }

  Row buildDeclarationOfConsentRadioButton() {
    return Row(
      children: [
        Radio(
          onChanged: (value) {},
          value: 1,
          groupValue: 0,
        ),
        Text("Rıza beyanını okudum onaylıyorum.")
      ],
    );
  }

  Row buildSocialMediaButtons(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(ImageConstants.instance.google),
          radius: size.width * .06,
        ),
        SizedBox(width: 20),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(ImageConstants.instance.facebook),
          radius: size.width * .06,
        ),
      ],
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.done,
          color: Colors.white,
        ),
        labelText: "E-Posta",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  SizedBox buildLoginButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * .9,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/chooseProfile');
        },
        child: Text(
          "Kayıt ol",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
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

  buildNameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ad",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  buildSurnameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Soyad",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  buildPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.done),
        labelText: "Şifre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  buildVerifyPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.done),
        labelText: "Şifre Tekrarı",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
