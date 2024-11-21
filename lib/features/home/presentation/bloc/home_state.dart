class HomeState {}

class initialHomeState extends HomeState {}

class NewArrivalsbookLoadedState extends HomeState {}

class NewArrivalsbookLoadingState extends HomeState {}

class SlidersLoadedState extends HomeState {}

class SlidersLoadingState extends HomeState {}

class HomeerroState extends HomeState {
  String? message;
  HomeerroState({required this.message});
}
