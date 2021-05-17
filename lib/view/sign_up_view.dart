import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

enum LoginSteps { first, second }

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _lastNameFieldController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();
  TextEditingController _rePasswordFieldController = TextEditingController();
  TextEditingController _birthDayFieldController = TextEditingController();

  bool isNameFieldValid = false;
  bool isLastNameFieldValid = false;
  bool isPasswordFieldValid = false;
  bool isRePasswordFieldValid = false;
  bool isBirthdayFieldValid = false;

  TextEditingController _schoolNameFieldController = TextEditingController();
  TextEditingController _cityFieldController = TextEditingController();
  TextEditingController _parentPhoneFieldController = TextEditingController();
  TextEditingController _parentMailFieldController = TextEditingController();

  bool isNextButonActivated = false;
  bool isRegisterButonActivated = false;
  LoginSteps _loginSteps = LoginSteps.first;
  bool privacyPolicyRadioChecked = false;
  bool declarationOfConsentRadioChecked = false;

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
    //Body placed 87,5% height of screen with all attributes below
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
            child: _loginSteps == LoginSteps.first
                ? buildFirstStepForm(size, context)
                : buildSecondStepForm(size, context),
          ),
        ),
      ),
    );
  }

  Form buildFirstStepForm(Size size, BuildContext context) {
    return Form(
      onChanged: checkFirstStepFormIsValid,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Social media buttons placed 10% height of screen
          SizedBox(
            height: size.height * .1,
            child: buildSocialMediaButtons(size),
          ),
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
            child: buildPasswordTextFormField(),
          ),
          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: buildVerifyPasswordTextFormField(),
          ),

          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: buildBirthDateTextFormField(),
          ),
          SizedBox(
              height: size.height * .08,
              width: size.width * .9,
              child: buildLoginButton(size, context)),
        ],
      ),
    );
  }

  Form buildSecondStepForm(Size size, BuildContext context) {
    return Form(
      onChanged: checkSecondStepFormIsValid,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Social media buttons placed 10% height of screen
          SizedBox(
            height: size.height * .1,
            child: buildSocialMediaButtons(size),
          ),
          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: TextFormField(
              controller: _schoolNameFieldController,
              decoration: InputDecoration(
                labelText: "Okul ismi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: TextFormField(
              controller: _cityFieldController,
              decoration: InputDecoration(
                labelText: "Şehir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: TextFormField(
              controller: _parentPhoneFieldController,
              decoration: InputDecoration(
                labelText: "Veli Telefon numarası",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
            width: size.width * .9,
            child: TextFormField(
              controller: _parentMailFieldController,
              decoration: InputDecoration(
                labelText: "Veli E-posta",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              buildPrivacyPolicyRadioButton(),
              buildDeclarationOfConsentRadioButton()
            ],
          ),
          SizedBox(
              height: size.height * .08,
              width: size.width * .9,
              child: buildLoginButton(size, context)),
        ],
      ),
    );
  }

  Row buildPrivacyPolicyRadioButton() {
    return Row(
      children: [
        Radio(
          toggleable: true,
          onChanged: (value) {
            setState(() {
              privacyPolicyRadioChecked = !privacyPolicyRadioChecked;
            });
            checkSecondStepFormIsValid();
          },
          value: privacyPolicyRadioChecked,
          groupValue: true,
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
          toggleable: true,
          onChanged: (value) {
            setState(() {
              declarationOfConsentRadioChecked =
                  !declarationOfConsentRadioChecked;
            });
            checkSecondStepFormIsValid();
          },
          value: declarationOfConsentRadioChecked,
          groupValue: true,
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

  ElevatedButton buildLoginButton(Size size, BuildContext context) {
    return ElevatedButton(
      onPressed: isNextButonActivated || isRegisterButonActivated
          ? () {
              if (_loginSteps == LoginSteps.first) {
                setState(() {
                  _loginSteps = LoginSteps.second;
                  isNextButonActivated = false;
                });
              } else if (_loginSteps == LoginSteps.second) {
                Navigator.of(context).pushNamed('/chooseProfile');
              }
            }
          : null,
      child: Text(
        _loginSteps == LoginSteps.first ? "İlerle" : "Kaydet",
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
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
      controller: _nameFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isNameFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isNameFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        labelText: "Ad",
        labelStyle: TextStyle(
          color: isNameFieldValid
              ? Theme.of(context).backgroundColor
              : Colors.grey,
        ),
      ),
    );
  }

  buildSurnameTextFormField() {
    return TextFormField(
      controller: _lastNameFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isLastNameFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isLastNameFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        labelText: "Soyad",
        labelStyle: TextStyle(
          color: isLastNameFieldValid
              ? Theme.of(context).backgroundColor
              : Colors.grey,
        ),
      ),
    );
  }

  buildPasswordTextFormField() {
    return TextFormField(
      controller: _passwordFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isPasswordFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isPasswordFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        suffixIcon: Opacity(
          opacity: isPasswordFieldValid ? 1 : 0,
          child: Icon(Icons.done,color: Theme.of(context).backgroundColor,),
        ),
        labelText: "Şifre",
        labelStyle: TextStyle(
          color: isPasswordFieldValid
              ? Theme.of(context).backgroundColor
              : Colors.grey,
        ),
      ),
    );
  }

  buildVerifyPasswordTextFormField() {
    return TextFormField(
      controller: _rePasswordFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isRePasswordFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isRePasswordFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        suffixIcon: Opacity(
          opacity: isRePasswordFieldValid ? 1 : 0,
          child: Icon(Icons.done,color: Theme.of(context).backgroundColor,),
        ),
        labelText: "Şifre Tekrarı",
        labelStyle: TextStyle(
          color: isRePasswordFieldValid
              ? Theme.of(context).backgroundColor
              : Colors.grey,
        ),
      ),
    );
  }

  buildBirthDateTextFormField() {
    return TextFormField(
      controller: _birthDayFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isBirthdayFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isBirthdayFieldValid
                  ? Theme.of(context).backgroundColor
                  : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        labelText: "Doğum tarihi",
        labelStyle: TextStyle(
          color: isBirthdayFieldValid
              ? Theme.of(context).backgroundColor
              : Colors.grey,
        ),
      ),
    );
  }

  bool get checkNameFieldFilled =>
      _nameFieldController.text != null && _nameFieldController.text.isNotEmpty;

  bool get checkLastNameFieldFilled =>
      _lastNameFieldController.text != null &&
      _lastNameFieldController.text.isNotEmpty;

  bool get checkPasswordFieldFilled =>
      _passwordFieldController.text != null &&
      _passwordFieldController.text.isNotEmpty;

  bool get checkRePasswordFieldFilled =>
      _rePasswordFieldController.text != null &&
      _rePasswordFieldController.text.isNotEmpty &&
      _passwordFieldController.text
              .compareTo(_rePasswordFieldController.text) ==
          0;

  bool get checkBirthDayFieldFilled =>
      _birthDayFieldController.text != null &&
      _birthDayFieldController.text.isNotEmpty;

  bool get checkSchoolNameFieldFilled =>
      _schoolNameFieldController.text != null &&
      _schoolNameFieldController.text.isNotEmpty;

  bool get checkCityFieldFilled =>
      _cityFieldController.text != null && _cityFieldController.text.isNotEmpty;

  bool get checkParentPhoneFieldFilled =>
      _parentPhoneFieldController.text != null &&
      _parentPhoneFieldController.text.isNotEmpty;

  bool get checkParentMailFieldFilled =>
      _parentMailFieldController.text != null &&
      _parentMailFieldController.text.isNotEmpty;

  bool get checkFirstStepFieldsAreComplete =>
      checkNameFieldFilled &&
      checkLastNameFieldFilled &&
      checkPasswordFieldFilled &&
      checkRePasswordFieldFilled &&
      checkBirthDayFieldFilled;

  bool get checkSecondStepFieldsAreComplete =>
      checkSchoolNameFieldFilled &&
      checkCityFieldFilled &&
      checkParentPhoneFieldFilled &&
      checkParentMailFieldFilled &&
      privacyPolicyRadioChecked &&
      declarationOfConsentRadioChecked;

  void checkFirstStepFormIsValid() {
    bool statusChanged = false;

    if (checkFirstStepFieldsAreComplete != isNextButonActivated) {
      isNextButonActivated = !isNextButonActivated;
      statusChanged = true;
    }
    if (checkNameFieldFilled != isNameFieldValid) {
      isNameFieldValid = !isNameFieldValid;
      statusChanged = true;
    }
    if (checkLastNameFieldFilled != isLastNameFieldValid) {
      isLastNameFieldValid = !isLastNameFieldValid;
      statusChanged = true;
    }
    if (checkPasswordFieldFilled != isPasswordFieldValid) {
      isPasswordFieldValid = !isPasswordFieldValid;
      statusChanged = true;
    }
    if (checkRePasswordFieldFilled != isRePasswordFieldValid) {
      isRePasswordFieldValid = !isRePasswordFieldValid;
      statusChanged = true;
    }
    if (checkBirthDayFieldFilled != isBirthdayFieldValid) {
      isBirthdayFieldValid = !isBirthdayFieldValid;
      statusChanged = true;
    }
    if (statusChanged) {
      setState(() {});
    }
  }

  void checkSecondStepFormIsValid() {
    bool statusChanged = false;
    if (checkSecondStepFieldsAreComplete != isRegisterButonActivated) {
      isRegisterButonActivated = !isRegisterButonActivated;
      statusChanged = true;
    }
    if (statusChanged) {
      setState(() {});
    }
  }
}
