import 'package:dodi/bloc/profile_cubit.dart';
import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/core/enums/profile_type_enum.dart';
import 'package:dodi/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfileExtra extends StatefulWidget {
  final String name;
  final String lastName;
  final bool isStudent;
  final bool profilePictureSelected;
  final int id;

  const CreateProfileExtra(
      {Key key,
      @required this.name,
      @required this.lastName,
      @required this.isStudent,
      @required this.id,
      @required this.profilePictureSelected})
      : super(key: key);

  @override
  _CreateProfileExtraState createState() => _CreateProfileExtraState();
}

class _CreateProfileExtraState extends State<CreateProfileExtra> {
  ProfileType _profileType;
  bool isProfilePictureSelected = false;
  TextEditingController _nameController;
  TextEditingController _lastNameController;
  bool isNameFieldValid = true;
  bool isLastNameFieldValid = true;
  bool isSaveButtonActive = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _lastNameController = TextEditingController(text: widget.lastName);
    _profileType = widget.isStudent ? ProfileType.Student : ProfileType.Parent;
    isProfilePictureSelected = widget.profilePictureSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageFooter(size),
          buildPageHeader(size),
          buildCreateProfileForm(size, context),
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
                "Profil Oluştur",
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

  Align buildCreateProfileForm(Size size, BuildContext context) {
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
              children: [
                SizedBox(height: size.height * .08),
                buildProfilePhoto(size),
                buildRadioButtons(),
                Column(
                  children: [
                    buildNameTextFormField(),
                    buildLastNameTextFormField(),
                  ],
                ),
                Spacer(),
                buildCreateProfileButton(size, context),
                Spacer(),
                buildDeleteProfileButton(size, context),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack buildProfilePhoto(Size size) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isProfilePictureSelected = !isProfilePictureSelected;
            });
          },
          child: ProfileWidget(
            image: isProfilePictureSelected
                ? _profileType == ProfileType.Parent
                    ? ImageConstants.instance.profile
                    : ImageConstants.instance.profile_child
                : null,
            name: "Profil Resmi Yükle",
            icon: Icons.add,
            size: size,
          ),
        ),
      ],
    );
  }

  Row buildRadioButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Radio(
              value: ProfileType.Student,
              groupValue: _profileType,
              onChanged: (value) {
                setState(() {
                  _profileType = value;
                });
              },
            ),
            Text("Öğrenci"),
          ],
        ),
        SizedBox(width: 16),
        Row(
          children: [
            Radio(
              value: ProfileType.Parent,
              groupValue: _profileType,
              onChanged: (value) {
                setState(() {
                  _profileType = value;
                });
              },
            ),
            Text("Veli"),
          ],
        ),
      ],
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
            "Bir öğrenci ya da veli profili yarat.",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Padding buildNameTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isNameFieldValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isNameFieldValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          labelText: "Ad",
          labelStyle: TextStyle(
            color: isNameFieldValid
                ? Theme.of(context).primaryColorLight
                : Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding buildLastNameTextFormField() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _lastNameController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isLastNameFieldValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isLastNameFieldValid
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          labelText: "Soyad",
          labelStyle: TextStyle(
            color: isLastNameFieldValid
                ? Theme.of(context).primaryColorLight
                : Colors.grey,
          ),
        ),
      ),
    );
  }

  SizedBox buildCreateProfileButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * .9,
      child: ElevatedButton(
        onPressed: isSaveButtonActive
            ? () async {
                await context.read<ProfileCubit>().updateUser(
                    _nameController.text,
                    _lastNameController.text,
                    isProfilePictureSelected,
                    _profileType,
                    widget.id);
                Navigator.of(context).pop();
              }
            : null,
        child: Text(
          "Kaydet",
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

  SizedBox buildDeleteProfileButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .05,
      width: size.width * .5,
      child: ElevatedButton(
          onPressed: () async {
           await context.read<ProfileCubit>().removeUser(widget.id);
           Navigator.pop(context);
          },
          child: Text(
            "Profili Sil",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.redAccent;
                return Colors.red;
              },
            ),
            shape: MaterialStateProperty.all(StadiumBorder()),
          )),
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

  bool get checkNameFieldFilled =>
      _nameController.text != null && _nameController.text.isNotEmpty;

  bool get checkLastNameFieldFilled =>
      _lastNameController.text != null && _lastNameController.text.isNotEmpty;

  bool get checkFormFieldsAreComplete =>
      checkNameFieldFilled && checkLastNameFieldFilled;

  void checkFormIsValid() {
    bool statusChanged = false;
    if (checkFormFieldsAreComplete != isSaveButtonActive) {
      isSaveButtonActive = !isSaveButtonActive;
      statusChanged = true;
    }
    if (isNameFieldValid != checkNameFieldFilled) {
      isNameFieldValid = !isNameFieldValid;
      statusChanged = true;
    }
    if (isLastNameFieldValid != checkLastNameFieldFilled) {
      isLastNameFieldValid = !isLastNameFieldValid;
      statusChanged = true;
    }
    if (statusChanged) {
      setState(() {});
    }
  }
}
