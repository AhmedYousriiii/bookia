import 'package:boookia/core/function/text_style_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/home/data/model/response/product_new_arrivals/product.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';

import 'package:boookia/features/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Papularbooklist extends StatefulWidget {
  const Papularbooklist({
    super.key,
  });

  @override
  State<Papularbooklist> createState() => _PapularbooklistState();
}

class _PapularbooklistState extends State<Papularbooklist> {
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(GetNewArrivalsbookEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is NewArrivalsbookLoadedState || current is NewArrivalsbookLoadingState,
      builder: (context, state) {
        if (state is NewArrivalsbookLoadedState) {
          var booklist = context.read<HomeBloc>().product;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Arrival Books",
                      style: get30text(fontsize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 280,
                      ),
                      itemBuilder: (context, index) {
                        return bookItem(book: booklist[index]);
                      },
                      itemCount: 6,
                    )
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class bookItem extends StatelessWidget {
  const bookItem({
    super.key,
    required this.book,
  });

  final Product book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.secondarycolor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.image ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              book.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: get20text(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    " ${book.priceAfterDiscount!.ceil().toString()} EGP",
                    style: get20text(fontsize: 18),
                  ),
                ),
                ButtonApp(
                  height: 27,
                  width: 72,
                  borderrides: 4,
                  onpress: () {},
                  text: "Buy",
                  color: ColorApp.darkcolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
