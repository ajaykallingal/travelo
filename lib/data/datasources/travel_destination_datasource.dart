import 'package:travelo/domain/entities/destination.dart';

class DestinationDummyDataSource {
  final List<Destination> destinations = [
    Destination(city: "New York", country: "USA"),
    Destination(city: "London", country: "UK"),
    Destination(city: "Tokyo", country: "Japan"),
    Destination(city: "Paris", country: "France"),
    Destination(city: "Dubai", country: "UAE"),
    Destination(city: "Sydney", country: "Australia"),
  ];

  Future<List<Destination>> searchDestinations(String query) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    return destinations
        .where((d) =>
    d.city.toLowerCase().contains(query.toLowerCase()) ||
        d.country.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
