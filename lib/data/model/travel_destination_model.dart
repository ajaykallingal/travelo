
import 'package:travelo/domain/entities/travel_destinations.dart';

class TravelDestinationModel extends TravelDestination {
  TravelDestinationModel({
    required super.imageUrl,
    required super.price,
    required super.details,
    required super.destination,
  });

  factory TravelDestinationModel.fromJson(Map<String, dynamic> json) {
    return TravelDestinationModel(
      imageUrl: json['imageUrl'],
      price: json['price'],
      details: json['details'],
      destination: json['destination'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'price': price,
      'details': details,
      'destination': destination,
    };
  }
}
