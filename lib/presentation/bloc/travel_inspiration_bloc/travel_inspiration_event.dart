part of 'travel_inspiration_bloc.dart';

sealed class TravelInspirationEvent extends Equatable {
  const TravelInspirationEvent();
}

class LoadTravelInspirations extends TravelInspirationEvent {
  @override
  List<Object?> get props => [];
}
