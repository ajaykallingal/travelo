import 'package:travelo/data/datasources/travel_destination_datasource.dart';
import 'package:travelo/domain/entities/destination.dart';
import 'package:travelo/domain/repositories/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationDummyDataSource dataSource;

  DestinationRepositoryImpl(this.dataSource);

  @override
  Future<List<Destination>> fetchDestinations(String query) {
    return dataSource.searchDestinations(query);
  }
}
