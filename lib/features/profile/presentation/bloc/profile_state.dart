// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileLoadedState extends ProfileState {}

class LogutLoadingState extends ProfileState {}

class logoutLoadedState extends ProfileState {}

class UpdateProfileLoadingState extends ProfileState {}

class updatePasswordLoadedState extends ProfileState {}

class updatePasswordLoadingState extends ProfileState {}

class UpdateProfileLoadedState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState({
    required this.message,
  });
}
