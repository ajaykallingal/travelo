import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/presentation/bloc/travel_destination/travel_destination_bloc.dart';

class DestinationSearchWidget extends StatelessWidget {
  const DestinationSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TravelDestinationBloc>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Search destinations",
              border: OutlineInputBorder(),
            ),
            onChanged: (query) => bloc.add(SearchDestinations(query)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<TravelDestinationBloc, TravelDestinationState>(
              builder: (context, state) {
                if (state is TravelDestinationLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TravelDestinationLoaded) {
                  return ListView.builder(
                    itemCount: state.destinations.length,
                    itemBuilder: (_, index) {
                      final destination = state.destinations[index];
                      return ListTile(
                        title: Text(destination.city),
                        subtitle: Text(destination.country),
                        onTap: () {
                          Navigator.pop(context, destination);
                        },
                      );
                    },
                  );
                } else if (state is TravelDestinationError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("Start searching destinations"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
