import 'package:boookia/features/home/presentation/bloc/home_state.dart';

class HomeEvent {}

class GetNewArrivalsbookEvent extends HomeEvent {}

class SlidersEvent extends HomeEvent {}

class WishListEvent extends HomeEvent {}

class AddToWishListEvent extends HomeEvent {
  final int productId;
  AddToWishListEvent({required this.productId});
}

class RemoveFormWishListEvent extends HomeEvent {
   final int productId;
  RemoveFormWishListEvent({required this.productId});
}
