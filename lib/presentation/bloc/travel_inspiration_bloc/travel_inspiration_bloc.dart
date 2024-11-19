import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travelo/domain/entities/travel_destinations.dart';
import 'package:travelo/domain/usecases/get_travel_inspirations.dart';

part 'travel_inspiration_event.dart';
part 'travel_inspiration_state.dart';

class TravelInspirationBloc
    extends Bloc<TravelInspirationEvent, TravelInspirationState> {
  final GetTravelInspirations getTravelInspirations;

  TravelInspirationBloc({required this.getTravelInspirations})
      : super(TravelInitial()) {
    on<LoadTravelInspirations>((event, emit) async {
      emit(TravelLoading());
      try {
        final destinations = await getTravelInspirations();
        emit(TravelLoaded(destinations: destinations));
      } catch (e) {
        emit(const TravelError(message: 'Failed to load data.'));
      }
    });
  }
}
