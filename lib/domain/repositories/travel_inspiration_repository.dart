
import 'package:travelo/domain/entities/travel_destinations.dart';

abstract class TravelRepository {
  Future<List<TravelDestination>> getTravelInspirations();
}
