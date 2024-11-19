import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travelo/domain/entities/destination.dart';
import 'package:travelo/domain/usecases/get_travel_destination.dart';

part 'travel_destination_event.dart';
part 'travel_destination_state.dart';

class TravelDestinationBloc extends Bloc<TravelDestinationEvent, TravelDestinationState> {
  final FetchDestinations fetchDestinations;
  TravelDestinationBloc({required this.fetchDestinations}) : super(TravelDestinationInitial()) {
    on<SearchDestinations>((event, emit) async{
      emit(TravelDestinationLoading());
      try {
        final destinations = await fetchDestinations(event.query);
        emit(TravelDestinationLoaded(destinations));
      }catch(e) {
        emit(const TravelDestinationError("Failed to load destinations."));

      }

    });
  }
}
