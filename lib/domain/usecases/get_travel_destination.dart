import 'package:travelo/domain/entities/destination.dart';
import 'package:travelo/domain/repositories/destination_repository.dart';

class FetchDestinations {
  final DestinationRepository repository;

  FetchDestinations(this.repository);

  Future<List<Destination>> call(String query) async {
    return await repository.fetchDestinations(query);
  }
}
