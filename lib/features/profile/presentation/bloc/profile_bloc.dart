import 'package:bloc/bloc.dart';
import 'package:boookia/features/profile/data/model/request/update_password.dart';
import 'package:boookia/features/profile/data/model/request/update_profile_prams.dart';
import 'package:boookia/features/profile/data/model/response/profile_response/profile_response.dart';
import 'package:boookia/features/profile/data/repo/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(getprofile);
    on<LogoutEvent>(logoutprofile);
    on<updateprofileEvent>(updateProfile);
    on<updatePasswordEvent>(updatePassword);
  }

  ProfileResponse? profileResponse;
  Future<void> getprofile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    try {
      await ProfileRepo.getprofile().then(
        (value) {
          if (value != null) {
            profileResponse = value;

            emit(GetProfileLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(ProfileErrorState(
          message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> logoutprofile(
      LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(LogutLoadingState());
    try {
      await ProfileRepo.logout().then(
        (value) {
          if (value == true) {
            emit(logoutLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(ProfileErrorState(
          message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> updateProfile(
      updateprofileEvent event, Emitter<ProfileState> emit) async {
    emit(UpdateProfileLoadingState());
    try {
      await ProfileRepo.updateprofile(prmas: event.prams).then(
        (value) {
          if (value == true) {
            emit(UpdateProfileLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(ProfileErrorState(
          message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> updatePassword(
      updatePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(updatePasswordLoadingState());
    try {
      await ProfileRepo.updatePassword(prmas: event.prams).then(
        (value) {
          if (value == true) {
            emit(updatePasswordLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(ProfileErrorState(
          message: 'Unexpected Error occur, please tryy again'));
    }
  }
}
