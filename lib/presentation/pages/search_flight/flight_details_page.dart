import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/presentation/bloc/search_flight_bloc/flight_bloc.dart';

import '../../../constants/colors.dart';

class FlightSearchDetailsScreen extends StatelessWidget {
  const FlightSearchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          'Ezy Travel',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: const Icon(Icons.arrow_back),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlightHeaderSection(),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  title: 'Mar 22 - Mar 23',
                  subTitle: "From AED 741",
                ),
                FilterButton(
                  title: 'Mar 23 - Mar 24',
                  subTitle: "From AED 741",
                ),
                FilterButton(
                  title: 'Mar 24 - Mar 26',
                  subTitle: "From AED 741",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Wrap in Expanded
          Expanded(
            child: FlightDetailsList(),
          ),
        ],
      ),
    );
  }
}

class FlightHeaderSection extends StatelessWidget {
  const FlightHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Flight details text
          RichText(
            text: const TextSpan(
              text: 'BLR - Bengaluru to DXB - Dubai\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Departure: Sat, 23 Mar - Return: Sat, 23 Mar\n',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '(Round Trip) ',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Modify Search',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          // Divider line
          const Divider(color: Colors.grey, thickness: 0.5),
          const SizedBox(height: 8),
          // Sort, Non-Stop, and Filter options
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _OptionButton(
                text: 'Sort',
                icon: Icons.arrow_drop_down,
              ),
              Text(
                'Non - Stop',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              _OptionButton(
                text: 'Filter',
                icon: Icons.filter_alt_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const _OptionButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4),
        Icon(icon, size: 20),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? icon;

  const FilterButton(
      {super.key, required this.title, this.icon, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Handle filter
      },
      icon: icon != null
          ? Icon(icon, size: 18, color: Colors.black)
          : const SizedBox.shrink(),
      label: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  final String dateRange;
  final String price;
  final bool isSelected;

  const DateChip({
    super.key,
    required this.dateRange,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEAF9E9) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? Colors.green : Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Text(
            dateRange,
            style: TextStyle(
                fontSize: 12, color: isSelected ? Colors.green : Colors.black),
          ),
          Text(
            'From $price',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class FlightDetailsList extends StatelessWidget {
  const FlightDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBloc, FlightState>(
      builder: (context, state) {
        if (state is FlightInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FlightSearchSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.flights.length,
            itemBuilder: (context, index) {
              final flight = state.flights[index];
              return FlightCard(
                flight: flight,
                airline: flight.airlineName,
                onwardTime: flight.departureTime,
                returnTime: flight.arrivalTime,
                onwardStops: flight.from,
                returnStops: flight.to,
                duration: flight.flightDuration,
                onwardPrice: flight.price.toString(),
                returnPrice: flight.price.toString(),
              );
            },
          );
        } else {
          return const Center(child: Text("No flights found"));
        }
      },
    );
  }
}

class FlightCard extends StatelessWidget {
  final String airline;
  final String onwardTime;
  final String returnTime;
  final String onwardStops;
  final String returnStops;
  final String duration;
  final String onwardPrice;
  final String returnPrice;

  const FlightCard({
    super.key,
    required this.airline,
    required this.onwardTime,
    required this.returnTime,
    required this.onwardStops,
    required this.returnStops,
    required this.duration,
    required this.onwardPrice,
    required this.returnPrice,
    required flight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Onward - $airline',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  Text(
                    'AED $onwardPrice',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green),
                  ),
                  // Text(
                  //   'AED $returnPrice',
                  //   style: const TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 18,
                  //       color: Colors.green),
                  // ),
                ],
              ),


              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlightDetail(time: onwardTime, location: 'BLR - Bengaluru'),
                  const Icon(Icons.flight, size: 20),
                  FlightDetail(time: returnTime, location: 'DXB - Dubai'),
                ],
              ),
              const SizedBox(height: 8),
              // Text('$duration · $onwardStops', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
              const Divider(),
              Text(
                'Return - $airline',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlightDetail(time: returnTime, location: 'DXB - Dubai'),
                  const Icon(Icons.flight, size: 20),
                  FlightDetail(time: onwardTime, location: 'BLR - Bengaluru'),
                ],
              ),
              const SizedBox(height: 8),
              Text('$duration · $returnStops'),
              const Divider(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       'AED $onwardPrice',
              //       style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18,
              //           color: Colors.green),
              //     ),
              //     // Text(
              //     //   'AED $returnPrice',
              //     //   style: const TextStyle(
              //     //       fontWeight: FontWeight.bold,
              //     //       fontSize: 18,
              //     //       color: Colors.green),
              //     // ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlightDetail extends StatelessWidget {
  final String time;
  final String location;

  const FlightDetail({super.key, required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(time,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text(location,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
