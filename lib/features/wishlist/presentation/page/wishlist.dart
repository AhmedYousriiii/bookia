import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(WishListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Wishlist",
            style: get30text(),
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is WishListLoadingState || state is RemoveFormWishListtLoadingState) {
              Center(child: CircularProgressIndicator());
            } else if (state is WishListLoadedState) {
              // Navigator.pop(context);
            } else if (state is RemoveFormWishListLoadedState) {
              context.read<HomeBloc>().add(WishListEvent());
            }
          },
          builder: (context, state) {
            var wishlist = context.read<HomeBloc>().wishlist;
            return wishlist.isEmpty
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
                        "The WishList isEmpty",
                        style: get15text(fontsize: 18),
                      )
                    ],
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                wishlist[index].image ?? "",
                                height: 100,
                                width: 118,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        wishlist[index].name ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: get16text(color: Color(0xff606060)),
                                      )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<HomeBloc>().add(RemoveFormWishListEvent(productId: wishlist[index].id ?? 0));
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/icons/Shape.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    wishlist[index].price ?? "",
                                    style: get20text(),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ButtonApp(
                                        height: 45,
                                        width: 180,
                                        onpress: () {},
                                        text: "Add To Cart",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        endIndent: 55,
                        indent: 55,
                        thickness: 1,
                      );
                    },
                    itemCount: wishlist.length);
          },
        ));
  }
}
