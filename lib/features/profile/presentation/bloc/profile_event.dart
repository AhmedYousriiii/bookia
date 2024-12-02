part of 'profile_bloc.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}

class updateprofileEvent extends ProfileEvent {
  final UpdateProfilePrams prams;
  updateprofileEvent({required this.prams});
}
