import 'package:dodi/bloc/profile_states.dart';
import 'package:dodi/core/enums/profile_type_enum.dart';
import 'package:dodi/view/create_profile_extra.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialState());
  List<User> _users = [];
  int id = 0;

  List<User> get users => _users;

  addUser(User user) {
    _users.add(user);
    this.id++;
    emit(AddProfileState());
  }

  updateUser(String name, String lastName, bool hasProfilePic,
      ProfileType profileType, int id) async {
    await _users
        .firstWhere((element) => element.id == id)
        .updateUser(name, lastName, hasProfilePic, profileType);
    emit(UpdateProfileState());
  }

  removeUser(int id) {
    _users.removeWhere((element) => element.id == id);
    emit(RemoveProfileState());
  }
}

class User {
  int id;
  String name;
  String lastName;
  ProfileType profileType;
  bool hasProfilePic;

  User(this.name, this.lastName, this.profileType, this.hasProfilePic, this.id);

  updateUser(String name, String lastName, bool hasProfilePic,
      ProfileType profileType) {
    this.name = name;
    this.lastName = lastName;
    this.hasProfilePic = hasProfilePic;
    this.profileType = profileType;
  }
}
