part of 'flight_bloc.dart';

sealed class FlightState extends Equatable {
  const FlightState();
}

class FlightInitial extends FlightState {
  final String tripType;

  const FlightInitial({this.tripType = 'round_trip'});

  @override
  List<Object?> get props => [tripType];
}

class FlightSearchLoading extends FlightState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FlightSearchSuccess extends FlightState {
  final List<Flight> flights;
  final String tripType;

  const FlightSearchSuccess({
    required this.flights,
    required this.tripType,
  });

  @override
  List<Object?> get props => [flights, tripType];
}

class FlightSearchError extends FlightState {
  final String message;

  const FlightSearchError(this.message);

  @override
  List<Object?> get props => [message];
}