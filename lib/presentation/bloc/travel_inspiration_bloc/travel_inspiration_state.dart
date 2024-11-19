part of 'travel_inspiration_bloc.dart';

sealed class TravelInspirationState extends Equatable {
  const TravelInspirationState();
}

class TravelInitial extends TravelInspirationState {
  @override
  List<Object?> get props => [];
}

class TravelLoading extends TravelInspirationState {
  @override
  List<Object?> get props =>[];
}

class TravelLoaded extends TravelInspirationState {
  final List<TravelDestination> destinations;

  const TravelLoaded({required this.destinations});

  @override
  List<Object?> get props => [destinations];
}

class TravelError extends TravelInspirationState {
  final String message;

  const TravelError({required this.message});

  @override
  List<Object?> get props => [message];
}
