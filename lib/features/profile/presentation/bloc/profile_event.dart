// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}

class updatePasswordEvent extends ProfileEvent {
  final UpdatePasswordprmas prams;
  updatePasswordEvent({
    required this.prams,
  });
}

class updateprofileEvent extends ProfileEvent {
  final UpdateProfilePrams prams;
  updateprofileEvent({required this.prams});
}
