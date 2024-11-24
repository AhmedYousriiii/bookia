import 'package:boookia/core/utils/color_app.dart';
import 'package:boookia/features/home/presentation/bloc/home_bloc.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

int currentIndex = 0;

class _BannerWidgetState extends State<BannerWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(SlidersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is SlidersLoadedState || current is SlidersLoadingState,
      builder: (context, state) {
        if (state is SlidersLoadedState) {
          var sliders = context.read<HomeBloc>().slider;
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        sliders[itemIndex].image ?? "",
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    height: 150,
                    viewportFraction: 0.85,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                  controller: PageController(
                    initialPage: currentIndex,
                  ), // PageController
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: ColorApp.primarycolor,
                    dotHeight: 7,
                    dotWidth: 7,
                    expansionFactor: 5,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
