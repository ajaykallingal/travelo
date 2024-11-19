import 'package:travelo/data/model/travel_destination_model.dart';

abstract class TravelDummyDataSource {
  Future<List<TravelDestinationModel>> fetchTravelInspirations();
}

class TravelDummyDataSourceImpl implements TravelDummyDataSource {
  @override
  Future<List<TravelDestinationModel>> fetchTravelInspirations() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      TravelDestinationModel(
        imageUrl: 'https://image.cnbcfm.com/api/v1/image/107364983-1706275482318-gettyimages-1420727921-saudiarabia0011299.jpeg?v=1724336615&w=1600&h=900',
        price: 'AED867',
        details: 'Economy round trip',
        destination: 'Saudi Arabia',
      ),
      TravelDestinationModel(
        imageUrl: 'https://mediaim.expedia.com/destination/1/b9d212f92b2d308b19b9c6b8af5047ad.jpg?impolicy=fcrop&w=450&h=280&q=medium',
        price: 'AED867',
        details: 'Economy round trip',
        destination: 'Kuwait',
      ),
      TravelDestinationModel(
        imageUrl: 'https://content.presspage.com/uploads/2431/1920_dubaiconnect.jpg?10000',
        price: 'AED999',
        details: 'Economy round trip',
        destination: 'Dubai',
      ),
      TravelDestinationModel(
        imageUrl: 'https://www.outlooktravelmag.com/media/oman-tg.png',
        price: 'AED745',
        details: 'Economy round trip',
        destination: 'Oman',
      ),
    ];
  }
}
