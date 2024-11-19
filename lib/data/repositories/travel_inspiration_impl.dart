import 'package:travelo/data/datasources/travel_inspiration_datesource.dart';
import 'package:travelo/domain/entities/travel_destinations.dart';
import 'package:travelo/domain/repositories/travel_inspiration_repository.dart';

class TravelRepositoryImpl implements TravelRepository {
  final TravelDummyDataSource dummyDataSource;

  TravelRepositoryImpl(this.dummyDataSource);

  @override
  Future<List<TravelDestination>> getTravelInspirations() async {
    return await dummyDataSource.fetchTravelInspirations();
  }
}
