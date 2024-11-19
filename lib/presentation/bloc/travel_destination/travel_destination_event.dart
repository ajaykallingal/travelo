part of 'travel_destination_bloc.dart';

sealed class TravelDestinationEvent extends Equatable {
  const TravelDestinationEvent();
}

class SearchDestinations extends TravelDestinationEvent {
  final String query;

  const SearchDestinations(this.query);

  @override
  List<Object?> get props => [query];
}