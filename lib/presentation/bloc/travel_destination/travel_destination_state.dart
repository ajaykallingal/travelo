part of 'travel_destination_bloc.dart';

sealed class TravelDestinationState extends Equatable {
  const TravelDestinationState();
}

final class TravelDestinationInitial extends TravelDestinationState {
  @override
  List<Object> get props => [];
}



class TravelDestinationLoading extends TravelDestinationState {
  @override
  List<Object?> get props => [];
}

class TravelDestinationLoaded extends TravelDestinationState {
  final List<Destination> destinations;

  const TravelDestinationLoaded(this.destinations);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TravelDestinationError extends TravelDestinationState {
  final String message;

  const TravelDestinationError(this.message);

  @override
  List<Object?> get props => [message];
}