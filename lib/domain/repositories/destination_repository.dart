import 'package:travelo/domain/entities/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> fetchDestinations(String query);
}
