import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travelo/domain/entities/flight.dart';
import '../../../data/datasources/remote_data_source.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc() : super(const FlightInitial()) {
    on<SearchFlightsEvent>((event, emit) async {
      emit(FlightSearchLoading());
      await Future.delayed(const Duration(seconds: 2)); // Simulate loading
      emit(FlightSearchSuccess( flights: dummyFlights, tripType: ''));
    });
  }
}

// class FlightBloc extends Bloc<FlightEvent, FlightState> {
//   final FlightRepository flightRepository;
//
//   FlightBloc({required this.flightRepository}) : super(const FlightInitial()) {
//     on<SearchFlightsEvent>(_onSearchFlights);
//     on<UpdateTripTypeEvent>(_onUpdateTripType);
//   }
//
//   Future<void> _onSearchFlights(
//       SearchFlightsEvent event,
//       Emitter<FlightState> emit,
//       ) async {
//     emit(FlightSearchLoading());
//
//     try {
//       final flights = await flightRepository.searchFlights(
//         origin: event.origin,
//         destination: event.destination,
//         date: event.date,
//         tripType: event.tripType,
//       );
//
//       emit(FlightSearchSuccess(flights: flights, tripType: event.tripType));
//     } catch (e) {
//       emit(FlightSearchError(e.toString()));
//     }
//   }
//
//   void _onUpdateTripType(
//       UpdateTripTypeEvent event,
//       Emitter<FlightState> emit,
//       ) {
//     if (state is FlightSearchSuccess) {
//       final currentState = state as FlightSearchSuccess;
//       emit(FlightSearchSuccess(
//         flights: currentState.flights,
//         tripType: event.tripType,
//       ));
//     } else {
//       emit(FlightInitial(tripType: event.tripType));
//     }
//   }
// }
