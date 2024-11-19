import 'package:travelo/domain/entities/flight.dart';

abstract class FlightRepository {
  Future<List<Flight>> searchFlights({
    required String origin,
    required String destination,
    required String date,
    required String tripType,
  });
}