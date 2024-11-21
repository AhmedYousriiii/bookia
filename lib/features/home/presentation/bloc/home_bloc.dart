import 'package:boookia/features/home/data/model/response/product_new_arrivals/product.dart';
import 'package:boookia/features/home/data/model/response/slider_model/slider.dart';
import 'package:boookia/features/home/data/repo/home_repo.dart';
import 'package:boookia/features/home/presentation/bloc/home_event.dart';
import 'package:boookia/features/home/presentation/bloc/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(initialHomeState()) {
    on<GetNewArrivalsbookEvent>(getNewArrivals);
    on<SlidersEvent>(getSliders);
  }

  List<Product> product = [];
  List<Slider> slider = [];

  Future<void> getNewArrivals(GetNewArrivalsbookEvent event, Emitter<HomeState> emit) async {
    try {
      emit(NewArrivalsbookLoadingState());
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
}
