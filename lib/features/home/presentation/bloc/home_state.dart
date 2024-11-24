class HomeState {}

class initialHomeState extends HomeState {}

class NewArrivalsbookLoadedState extends HomeState {}

class NewArrivalsbookLoadingState extends HomeState {}

class SlidersLoadedState extends HomeState {}

class SlidersLoadingState extends HomeState {}

class WishListLoadedState extends HomeState {}

class WishListLoadingState extends HomeState {}

class AddtoListLoadedState extends HomeState {}

class AddtoLoadingState extends HomeState {}

class RemoveFormWishListLoadedState extends HomeState {}

class RemoveFormWishListtLoadingState extends HomeState {}

class HomeerroState extends HomeState {
  String? message;
  HomeerroState({required this.message});
}
