import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class PhoneRegisterView extends StatefulWidget {
  @override
  _PhoneRegisterViewState createState() => _PhoneRegisterViewState();
}

class _PhoneRegisterViewState extends State<PhoneRegisterView> {
  bool isVerificationCodeSended = false;
  TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildPageFooter(size),
          buildPhoneForm(size, context),
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
                "Telefon Numarası ile Giriş",
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

  Align buildPhoneForm(Size size, BuildContext context) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Column(
                  children: [
                    Opacity(
                      opacity: isVerificationCodeSended ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "Lütfen T8A8M referans kodlu tek kullanımlık şifrenizi girin.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    buildPhoneNumberTextFormField(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                          child: buildRemembermeRadioButton(),
                          visible: !isVerificationCodeSended,
                        ),
                        Visibility(
                          child: buildRemainingTime(),
                          visible: isVerificationCodeSended,
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                buildSendVerificationCodeButton(size, context),
                SizedBox(height: size.height * .08)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRemainingTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("01:27"),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.watch_later_outlined,
          size: 20,
          color: Theme.of(context).backgroundColor,
        )
      ],
    );
  }

  Row buildRemembermeRadioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          onChanged: (value) {},
          value: 1,
          groupValue: 0,
        ),
        Text(
          "Beni hatırla",
        ),
      ],
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
                    style: TextStyle(
                      color: Colors.white,
                    )),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/register');
              },
              child: Text(
                "E posta ile Giriş Yap",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white),
              ),
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
      ],
    );
  }

  Padding buildEmailTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.done),
          labelText: "E-Posta",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPhoneNumberTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _inputController,
        textAlign:
            isVerificationCodeSended ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          labelText: isVerificationCodeSended ? null : "Telefon Numarası",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSendVerificationCodeButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * .9,
      child: ElevatedButton(
        onPressed: isVerificationCodeSended
            ? () {
                Navigator.of(context).pushNamed("/chooseProfile");
              }
            : () {
                setState(() {
                  _inputController.clear();
                  isVerificationCodeSended = true;
                });
              },
        child: Text(
          isVerificationCodeSended ? "Devam Et " : "Onay Kodu Gönder",
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
}
