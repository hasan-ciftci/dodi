import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isRememberMeChecked = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isLoginButtonActive = false;
  bool isPasswordObscure = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageFooter(size),
          buildPageHeader(size),
          buildLoginForm(size, context),
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
                "Üye girişi",
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

  Align buildLoginForm(Size size, BuildContext context) {
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
          child: Form(
            onChanged: checkFirstStepFormIsValid,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.height * .15,
                ),
                Column(
                  children: [
                    SizedBox(height: size.height * .04),
                    buildEmailTextFormField(),
                    buildPasswordTextFormField(),
                    buildRememberMeRadioButton(),
                  ],
                ),
                Spacer(),
                buildLoginButton(size, context),
                SizedBox(height: size.height * .02),
                Text("Şifremi unuttum",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Theme.of(context).disabledColor)),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildRememberMeRadioButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRememberMeChecked = !isRememberMeChecked;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio(
            toggleable: true,
            onChanged: (value) {
              setState(() {
                isRememberMeChecked = !isRememberMeChecked;
              });
            },
            value: isRememberMeChecked,
            groupValue: true,
          ),
          Text(
            "Beni hatırla",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Theme.of(context).disabledColor),
          ),
        ],
      ),
    );
  }

  Align buildPageFooter(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hesabınız yok mu?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: Text(
                    "Hesap Oluştur",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Telefon Numarası ile",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/phoneRegister');
                  },
                  child: Text(
                    "Giriş Yap",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildSocialMediaButtons(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset(ImageConstants.instance.google),
          backgroundColor: Colors.white,
          radius: size.width * .06,
        ),
        SizedBox(width: 20),
        CircleAvatar(
          child: Image.asset(ImageConstants.instance.facebook),
          backgroundColor: Colors.white,
          radius: size.width * .06,
        ),
        SizedBox(width: 20),
        CircleAvatar(
          child: Image.asset(ImageConstants.instance.apple),
          backgroundColor: Colors.white,
          radius: size.width * .06,
        ),
      ],
    );
  }

  Padding buildEmailTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isEmailValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isEmailValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          suffixIcon: Opacity(
              opacity: isEmailValid ? 1 : 0,
              child:
                  Icon(Icons.done, color: Theme.of(context).primaryColorLight)),
          labelText: "E-Posta",
          labelStyle: TextStyle(
            color: isEmailValid
                ? Theme.of(context).primaryColorLight
                : Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding buildPasswordTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _passwordController,
        obscureText: isPasswordObscure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isPasswordValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isPasswordValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscure = !isPasswordObscure;
                });
              },
              child: Opacity(
                  opacity: isPasswordValid ? 1 : 0,
                  child: Icon(
                      isPasswordObscure
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: Theme.of(context).primaryColorLight))),
          labelText: "Şifre",
          labelStyle: TextStyle(
            color: isPasswordValid
                ? Theme.of(context).primaryColorLight
                : Colors.grey,
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
        onPressed: isLoginButtonActive
            ? () {
                Navigator.of(context).pushNamed('/chooseProfile');
              }
            : null,
        child: Text(
          "Giriş Yap",
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

  bool get checkPasswordFieldFilled =>
      _passwordController.text != null && _passwordController.text.isNotEmpty;

  bool get checkEmailFieldFilled =>
      _emailController.text != null && _emailController.text.isNotEmpty;

  bool get checkFormFieldsAreComplete =>
      checkPasswordFieldFilled && checkEmailFieldFilled;

  void checkFirstStepFormIsValid() {
    bool statusChanged = false;
    if (isEmailValid != checkEmailFieldFilled) {
      isEmailValid = !isEmailValid;
      statusChanged = true;
    }

    if (isPasswordValid != checkPasswordFieldFilled) {
      isPasswordValid = !isPasswordValid;
      statusChanged = true;
    }

    if (checkFormFieldsAreComplete != isLoginButtonActive) {
      isLoginButtonActive = !isLoginButtonActive;
      statusChanged = true;
    }

    if (statusChanged) {
      setState(() {});
    }
  }
}
