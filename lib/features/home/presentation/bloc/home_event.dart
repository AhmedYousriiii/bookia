import 'package:boookia/features/cart/data/model/request/place_order_prams.dart';

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

class CartEvent extends HomeEvent {}

class AddtoCartEvent extends HomeEvent {
  final int productId;
  AddtoCartEvent({required this.productId});
}

class RemoveFormCartEvent extends HomeEvent {
  final int itemId;

  RemoveFormCartEvent({required this.itemId});
}

class UpdateCartEvent extends HomeEvent {
  final int cartitemid;
  final int quantity;

  UpdateCartEvent({required this.cartitemid, required this.quantity});
}

class CheckoutEvent extends HomeEvent {}

class PlaceOrderEvent extends HomeEvent {
  final PlaceOrderPrams Prams;
  PlaceOrderEvent({
    required this.Prams,
  });
}
