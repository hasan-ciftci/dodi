import 'package:dodi/bloc/profile_states.dart';
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

  removeUser(int id) {
    _users.removeWhere((element) => element.id == id);
    emit(RemoveProfileState());
  }
}

class User {
  final int id;
  final String name;
  final String lastName;
  final ProfileType profileType;
  final bool hasProfilePic;

  User(this.name, this.lastName, this.profileType, this.hasProfilePic, this.id);
}
