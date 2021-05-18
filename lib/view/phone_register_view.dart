import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneRegisterView extends StatefulWidget {
  @override
  _PhoneRegisterViewState createState() => _PhoneRegisterViewState();
}

class _PhoneRegisterViewState extends State<PhoneRegisterView> {
  bool isVerificationCodeSent = false;
  bool rememberMeChecked = false;
  bool isPhoneNumberValid = false;
  bool isVerificationCodeValid = false;
  TextEditingController _inputController;
  MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+90 ### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  MaskTextInputFormatter verificationCodeMaskFormatter =
      MaskTextInputFormatter(mask: '# # # #', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

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
            onChanged: checkFormIsValid,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Column(
                  children: [
                    buildVerificationInformationText(),
                    buildPhoneNumberTextFormField(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                          child: buildRememberMeRadioButton(),
                          visible: !isVerificationCodeSent,
                        ),
                        Visibility(
                          child: buildRemainingTime(),
                          visible: isVerificationCodeSent,
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

  Opacity buildVerificationInformationText() {
    return Opacity(
      opacity: isVerificationCodeSent ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Text(
          "Lütfen T8A8M referans kodlu tek kullanımlık şifrenizi girin.",
          textAlign: TextAlign.center,
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

  Row buildRememberMeRadioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          toggleable: true,
          onChanged: (value) {
            setState(() {
              rememberMeChecked = !rememberMeChecked;
            });
          },
          value: rememberMeChecked,
          groupValue: true,
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

  Padding buildPhoneNumberTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: [
          isVerificationCodeSent
              ? verificationCodeMaskFormatter
              : phoneMaskFormatter
        ],
        keyboardType: TextInputType.number,
        controller: _inputController,
        textAlign: isVerificationCodeSent ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          labelText: isVerificationCodeSent ? null : "Telefon Numarası",
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
        onPressed: (isPhoneNumberValid && !isVerificationCodeSent)
            ? () {
                setState(() {
                  _inputController.clear();
                  isVerificationCodeSent = true;
                });
              }
            : (isVerificationCodeSent && isVerificationCodeValid)
                ? () {
                    Navigator.of(context).pushNamed("/chooseProfile");
                  }
                : null,
        child: Text(
          isVerificationCodeSent ? "Devam Et " : "Onay Kodu Gönder",
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

  /// 17 => Length of +90 ### ### ## ##
  bool get checkPhoneFieldIsFilled => _inputController.text.length == 17;

  /// 7 => Length of # # # #
  bool get checkVerificationCodeFilled => _inputController.text.length == 7;

  void checkFormIsValid() {
    bool statusChanged = false;
    if (isPhoneNumberValid != checkPhoneFieldIsFilled) {
      isPhoneNumberValid = !isPhoneNumberValid;
      statusChanged = true;
    }

    if (isVerificationCodeValid != checkVerificationCodeFilled) {
      isVerificationCodeValid = !isVerificationCodeValid;
      statusChanged = true;
    }

    if (statusChanged) {
      setState(() {});
    }
  }
}
