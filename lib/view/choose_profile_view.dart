import 'package:dodi/bloc/profile_cubit.dart';
import 'package:dodi/bloc/profile_states.dart';
import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/core/enums/profile_type_enum.dart';
import 'package:dodi/view/create_profile_view.dart';
import 'package:dodi/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_profile_extra.dart';

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

  buildProfiles(Size size, BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, state) {
        List<User> users = context.read<ProfileCubit>().users;
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: buildBottomSheetActions(
                            profiles: users,
                            size: size,
                            crossAxisLength: 2,
                            context: context),
                      ),
                    )),
                buildEditProfilesButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBottomSheetActions(
      {@required int crossAxisLength,
      @required List<User> profiles,
      Size size,
      BuildContext context}) {
    if (profiles.length == 0) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<ProfileCubit>(context),
                      child: CreateProfileView(),
                    )),
          );
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                    value:
                                        BlocProvider.of<ProfileCubit>(context),
                                    child: CreateProfileView(),
                                  )),
                        );
                      },
                      child: ProfileWidget(
                        icon: Icons.add,
                        name: 'Yeni Ekle',
                        size: size,
                      ),
                    )
                  : columnIndex * crossAxisLength + rowIndex > profiles.length
                      ? Container(
                          margin: EdgeInsets.all(8.0),
                          height: size.width / 4,
                          width: size.width / 4,
                        )
                      : GestureDetector(
                          onTap: () {
                            if (editMode == true)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value:
                                        BlocProvider.of<ProfileCubit>(context),
                                    child: CreateProfileExtra(
                                      isStudent: profiles[columnIndex *
                                                      crossAxisLength +
                                                  rowIndex]
                                              .profileType ==
                                          ProfileType.Student,
                                      lastName: profiles[
                                              columnIndex * crossAxisLength +
                                                  rowIndex]
                                          .lastName,
                                      name: profiles[
                                              columnIndex * crossAxisLength +
                                                  rowIndex]
                                          .name,
                                      id: profiles[
                                              columnIndex * crossAxisLength +
                                                  rowIndex]
                                          .id,
                                      profilePictureSelected: profiles[
                                                  columnIndex *
                                                          crossAxisLength +
                                                      rowIndex]
                                              .hasProfilePic !=
                                          false,
                                    ),
                                  ),
                                ),
                              );
                            else
                              Navigator.of(context).pushNamed("/newClassSelectView");
                          },
                          child: ProfileWidget(
                            isEditing: editMode,
                            icon: Icons.person,
                            name: profiles[
                                    columnIndex * crossAxisLength + rowIndex]
                                .name,
                            size: size,
                            image: profiles[columnIndex * crossAxisLength +
                                        rowIndex]
                                    .hasProfilePic
                                ? profiles[columnIndex * crossAxisLength +
                                                rowIndex]
                                            .profileType ==
                                        ProfileType.Parent
                                    ? ImageConstants.instance.profile
                                    : ImageConstants.instance.profile_child
                                : null,
                          ),
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
