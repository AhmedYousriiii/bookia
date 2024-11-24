import 'package:boookia/core/function/dilogs.dart';
import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';

import 'package:boookia/features/home/data/model/response/product_new_arrivals/product.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';
import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.product});
  final Product product;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddtoLoadingState) {
          Center(child: CircularProgressIndicator());
        } else if (state is AddtoListLoadedState) {
          // Navigator.pop(context);
          showMessageDialog(context, "Added To wishlist", DialogType.suceess);
        }
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 18, 18),
          child: Row(
            children: [
              Text(
                "${widget.product.price} \$",
                style: get20text(),
              ),
              SizedBox(
                width: 90,
              ),
              Expanded(
                child: ButtonApp(
                  onpress: () {},
                  text: "Add To Cart",
                  color: ColorApp.darkcolor,
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(AddToWishListEvent(productId: widget.product.id ?? 0));
              },
              child: SvgPicture.asset("assets/icons/Bookmark.svg"),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.product.id.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.product.image ?? "",
                      height: 270,
                      width: 183,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.name ?? "",
                  style: get20text(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.category ?? "",
                  style: get20text(color: ColorApp.primarycolor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.product.description ?? "",
                  style: get20text(fontsize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
