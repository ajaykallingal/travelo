

import '../../domain/entities/flight.dart';

List<Flight> dummyFlights = [
  Flight(
    from: 'BLR - Bengaluru',
    to: 'DXB - Dubai',
    departureTime: '14:35',
    arrivalTime: '21:55',
    flightDuration: '4h 30m',
    stops: '2 Stops',
    price: 409,
    isCheapest: true,
    isRefundable: true,
    airlineName: 'Garuda Indonesia',
  ),
  Flight(
    from: 'DXB - Dubai',
    to: 'BLR - Bengaluru',
    departureTime: '21:55',
    arrivalTime: '14:35',
    flightDuration: '4h 30m',
    stops: '2 Stops',
    price: 359,
    isCheapest: false,
    isRefundable: true,
    airlineName: 'Garuda Indonesia',
  ),
];
