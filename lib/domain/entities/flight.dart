// domain/entities/flight.dart

class Flight {
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final String flightDuration;
  final String stops;
  final int price;
  final bool isCheapest;
  final bool isRefundable;
  final String airlineName;

  Flight({
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDuration,
    required this.stops,
    required this.price,
    required this.isCheapest,
    required this.isRefundable,
    required this.airlineName,
  });
}
