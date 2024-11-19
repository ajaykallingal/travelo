import 'package:travelo/domain/entities/travel_destinations.dart';
import 'package:travelo/domain/repositories/travel_inspiration_repository.dart';

class GetTravelInspirations {
  final TravelRepository repository;

  GetTravelInspirations(this.repository);

  Future<List<TravelDestination>> call() async {
    return await repository.getTravelInspirations();
  }
}
