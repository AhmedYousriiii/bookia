import 'package:boookia/features/cart/data/model/response/cart_model_response/cart_model_response.dart';
import 'package:boookia/features/cart/data/repo/cart_repo.dart';
import 'package:boookia/features/home/data/model/response/product_new_arrivals/product.dart';
import 'package:boookia/features/home/data/model/response/slider_model/slider.dart';
import 'package:boookia/features/home/data/repo/home_repo.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';
import 'package:boookia/features/wishlist/data/repo/wishlist_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(initialHomeState()) {
    on<GetNewArrivalsbookEvent>(getNewArrivals);
    on<SlidersEvent>(getSliders);
    on<WishListEvent>(getWishlList);
    on<AddToWishListEvent>(addtoWishlList);
    on<RemoveFormWishListEvent>(removetoWishlList);
    on<CartEvent>(getCart);
    on<AddtoCartEvent>(addtoCart);
    on<RemoveFormCartEvent>(removeFormCart);
    on<UpdateCartEvent>(updateCart);
    on<CheckoutEvent>(checkout);
    on<PlaceOrderEvent>(placeorder);
  }

  List<Product> product = [];
  List<Slider> slider = [];
  List<Product> wishlist = [];
  CartModelResponse? cartModelResponse;

  Future<void> getNewArrivals(
      GetNewArrivalsbookEvent event, Emitter<HomeState> emit) async {
    emit(NewArrivalsbookLoadingState());
    try {
      await HomeRepo.getNewArrivalBook().then(
        (value) {
          if (value != null) {
            product = value.data?.products ?? [];
            emit(NewArrivalsbookLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> getSliders(SlidersEvent event, Emitter<HomeState> emit) async {
    emit(SlidersLoadingState());
    try {
      emit(SlidersLoadingState());
      await HomeRepo.getSliders().then(
        (value) {
          if (value != null) {
            slider = value.data?.sliders ?? [];
            emit(SlidersLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> getWishlList(
      WishListEvent event, Emitter<HomeState> emit) async {
    emit(WishListLoadingState());
    try {
      await WishListRepo.getwishlist().then(
        (value) {
          if (value != null) {
            wishlist = value.data?.data ?? [];
            emit(WishListLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> addtoWishlList(
      AddToWishListEvent event, Emitter<HomeState> emit) async {
    emit(AddtoWishlistLoadingState());
    try {
      await WishListRepo.addToWishlist(productId: event.productId).then(
        (value) {
          if (value == true) {
            emit(AddtoWishListLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> removetoWishlList(
      RemoveFormWishListEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFormWishListtLoadingState());
    try {
      await WishListRepo.removeFormToWishlist(productId: event.productId).then(
        (value) {
          if (value == true) {
            emit(RemoveFormWishListLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> getCart(CartEvent event, Emitter<HomeState> emit) async {
    emit(cartLoadingState());
    try {
      await CartRepo.getcart().then(
        (value) {
          if (value != null) {
            cartModelResponse = value;
            emit(CartLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> addtoCart(AddtoCartEvent event, Emitter<HomeState> emit) async {
    emit(AddtoCartLoadingState());
    try {
      await CartRepo.addTocart(productId: event.productId).then(
        (value) {
          if (value == true) {
            emit(AddtoCartLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> removeFormCart(
      RemoveFormCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFormCartLoadingState());
    try {
      await CartRepo.removeFormcart(
        cartItemId: event.itemId,
      ).then(
        (value) {
          if (value == true) {
            emit(RemoveFormCartLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<HomeState> emit) async {
    emit(UpdatecartLoadingState());
    try {
      await CartRepo.updatecart(
              cartitem: event.cartitemid, quantity: event.quantity)
          .then(
        (value) {
          if (value != null) {
            cartModelResponse = value;
            emit(UpdateCartLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> checkout(CheckoutEvent event, Emitter<HomeState> emit) async {
    emit(CheckoutLoadingState());
    try {
      await CartRepo.checkout().then(
        (value) {
          if (value == true) {
            emit(CheckoutLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }

  Future<void> placeorder(
      PlaceOrderEvent event, Emitter<HomeState> emit) async {
    emit(PlaceOrderLoadingState());
    try {
      await CartRepo.placeOrder(prams: event.Prams).then(
        (value) {
          if (value == true) {
            emit(CheckoutLoadedState());
          }
        },
      );
    } on Exception catch (e) {
      emit(HomeerroState(message: 'Unexpected Error occur, please tryy again'));
    }
  }
}
