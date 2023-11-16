import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:weatherio/core/constrains/global_things.dart';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';
import 'package:weatherio/features/feauter_home/domain/use_cases/get_weather_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetWeatherUseCase getWeatherUseCase;
  HomeBloc({required this.getWeatherUseCase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetWeatherEvent) {
        emit(WaitState());
        bool isConnect = await checkConnection();
        final weather = await getWeatherUseCase.call(event.city);
        weather.fold((error) {
          emit(ErrorState(error));
        }, (weather) async {
          weather.isEmpty
              ? emit(NoDataAndInterState(
                  "No Data in cached And internet Check the connection of internet"))
              : emit(GetWeatherState(weather, isConnect));
        });
      }
    });
  }
}
