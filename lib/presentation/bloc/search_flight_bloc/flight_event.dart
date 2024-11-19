part of 'flight_bloc.dart';

sealed class FlightEvent extends Equatable {
  const FlightEvent();
}

class SearchFlightsEvent extends FlightEvent {
  final String origin;
  final String destination;
  final String date;
  final String tripType;

  const SearchFlightsEvent({
    required this.origin,
    required this.destination,
    required this.date,
    required this.tripType,
  });

  @override
  List<Object?> get props => [origin, destination, date, tripType];
}


class UpdateTripTypeEvent extends FlightEvent {
  final String tripType;

  const UpdateTripTypeEvent(this.tripType);

  @override
  List<Object?> get props => [tripType];
}