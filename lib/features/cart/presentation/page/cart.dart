import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/navigator_app.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/cart/data/model/response/cart_model_response/cart_item.dart';
import 'package:boookia/features/cart/presentation/page/check_out.dart';

import 'package:boookia/features/cart/presentation/widget/cart_item.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';
import 'package:boookia/features/widget/button_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is cartLoadingState ||
            state is RemoveFormCartLoadingState ||
            state is UpdatecartLoadingState ||
            state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CartLoadedState) {
          Navigator.pop(context);
        } else if (state is UpdateCartLoadedState) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(CartEvent());
        } else if (state is RemoveFormCartLoadedState) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(CartEvent());
        } else if (state is CheckoutLoadedState) {
          var cart = context.read<HomeBloc>().cartModelResponse?.data?.total;
          Navigator.pop(context);
          pushto(
              context,
              CheckOutScreen(
                total: cart.toString(),
              ));
        }
      },
      builder: (context, state) {
        var cart = context.read<HomeBloc>().cartModelResponse;
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "My Cart",
                style: get20text(fontsize: 24),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              child: cart?.data?.cartItems?.isNotEmpty == true
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Text(
                                "Total:",
                                style: get15text(
                                    color: ColorApp.darkgraycolor,
                                    fontsize: 20,
                                    fontweight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                " ${cart?.data?.total}\$",
                                style: get20text(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonApp(
                          text: "Checkout",
                          onpress: () {
                            context.read<HomeBloc>().add(CheckoutEvent());
                          },
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            body: cart?.data?.cartItems?.isEmpty == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: SvgPicture.asset(
                        "assets/icons/Bookmark.svg",
                        height: 100,
                        color: ColorApp.primarycolor,
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "The Cart isEmpty",
                        style: get15text(fontsize: 18),
                      )
                    ],
                  )
                : cartbulider(cart?.data?.cartItems ?? []));
      },
    );
  }

  ListView cartbulider(List<CartItem> cartlist) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Cartwidget(
            cartitem: cartlist[index],
            onAdd: () {
              if ((cartlist[index].itemQuantity ?? 0) <
                  (cartlist[index].itemProductStock ?? 0)) {
                context.read<HomeBloc>().add(
                      UpdateCartEvent(
                        cartitemid: cartlist[index].itemId ?? 0,
                        quantity: (cartlist[index].itemQuantity ?? 0) + 1,
                      ),
                    );
              } else {
                showMessageDialog(context, "item is out of stack");
              }
            },
            onRemove: () {
              context.read<HomeBloc>().add(
                  RemoveFormCartEvent(itemId: cartlist[index].itemId ?? 0));
            },
            onminus: () {
              if ((cartlist[index].itemQuantity ?? 0) > 1) {
                context.read<HomeBloc>().add(
                      UpdateCartEvent(
                          cartitemid: cartlist[index].itemId ?? 0,
                          quantity: (cartlist[index].itemQuantity ?? 0) - 1),
                    );
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            endIndent: 55,
            indent: 55,
            thickness: 1,
          );
        },
        itemCount: cartlist.length);
  }
}
