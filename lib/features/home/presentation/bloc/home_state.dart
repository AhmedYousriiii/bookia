class HomeState {}

class initialHomeState extends HomeState {}

class NewArrivalsbookLoadedState extends HomeState {}

class NewArrivalsbookLoadingState extends HomeState {}

class SlidersLoadedState extends HomeState {}

class SlidersLoadingState extends HomeState {}

class WishListLoadedState extends HomeState {}

class WishListLoadingState extends HomeState {}

class AddtoWishListLoadedState extends HomeState {}

class AddtoWishlistLoadingState extends HomeState {}

class RemoveFormWishListLoadedState extends HomeState {}

class RemoveFormWishListtLoadingState extends HomeState {}

class CartLoadedState extends HomeState {}

class cartLoadingState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class UpdatecartLoadingState extends HomeState {}

class AddtoCartLoadedState extends HomeState {}

class AddtoCartLoadingState extends HomeState {}

class RemoveFormCartLoadedState extends HomeState {}

class RemoveFormCartLoadingState extends HomeState {}

class CheckoutLoadedState extends HomeState {}

class CheckoutLoadingState extends HomeState {}

class PlaceOrdertLoadedState extends HomeState {}

class PlaceOrderLoadingState extends HomeState {}

class HomeerroState extends HomeState {
  String? message;
  HomeerroState({required this.message});
}
