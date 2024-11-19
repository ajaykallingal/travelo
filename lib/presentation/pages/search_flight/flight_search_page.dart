import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/constants/assets.dart';
import 'package:travelo/constants/colors.dart';
import 'package:travelo/presentation/bloc/travel_destination/travel_destination_bloc.dart';
import 'package:travelo/presentation/bloc/travel_inspiration_bloc/travel_inspiration_bloc.dart';
import 'package:travelo/presentation/widgets/destination_search_widget.dart';
import 'package:travelo/presentation/widgets/tab_bar_widget.dart';
import 'package:travelo/presentation/widgets/travel_card.dart';
import 'package:travelo/presentation/widgets/travel_plan_widget.dart';
import 'package:travelo/presentation/widgets/travel_search_textFied.dart';

import '../../../domain/entities/destination.dart';
import '../../bloc/search_flight_bloc/flight_bloc.dart';
import 'flight_details_page.dart';


class FlightSearchScreen extends StatefulWidget {

  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {

  DateTime selectedDate = DateTime.now();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
   TravelDestinationBloc? bloc;



  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _swapLocations() {
    final String temp = _fromController.text;
    setState(() {
      _fromController.text = _toController.text;
      _toController.text = temp;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 76,
            backgroundColor: AppColors.appBarColor,
            leading: const SizedBox(),
            titleSpacing: 0,
            title: const Text(
              'Search Flights',
              style: TextStyle(
                fontFamily: "Metropolis",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.appBarTitleColor,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.appBarTitleColor,
                ),
                onPressed: () {},
              ),
            ],
          ),

          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: 250),
            pinned: false,
          ),

           const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
              child: TravelSearchTextFields(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: TravelPlanWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.elevatedButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // Border radius
                  ),
                ),
                onPressed: () {
                  context.read<FlightBloc>().add(SearchFlightsEvent(
                      origin: _fromController.text,
                      destination: _toController.text,
                      date: "date",
                      tripType: "tripType"),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlightSearchDetailsScreen(),
                    ),
                  );
                },
                child: const Text("Search Flights"),
              ),
            ),
          ),
          // Travel Inspirations
          SliverToBoxAdapter(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Travel Inspirations",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0),
                    child: BlocBuilder<TravelInspirationBloc, TravelInspirationState>(
                      builder: (context, state) {
                        if (state is TravelLoading) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.statusBarColor,));
                        } else if (state is TravelLoaded) {
                          return SizedBox(
                            height: 313,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.destinations.length,
                              itemBuilder: (context, index) {
                                return TravelCard(destination: state.destinations[index]);
                              },
                            ),
                          );
                        } else if (state is TravelError) {
                          return Center(child: Text(state.message));
                        }
                        return const Center(child: Text('No data available.'));
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTravelCard("Saudi Arabia", "AED867")),
                      const SizedBox(width: 8),
                      Expanded(child: _buildTravelCard("Kuwait", "AED867")),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Flight & Hotel Packages
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding:
          //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const Text(
          //           "Flight & Hotel Packages",
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //         ),
          //         const SizedBox(height: 8),
          //         Container(
          //           height: 200,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             image: const DecorationImage(
          //               image: AssetImage(Assets.PACKAGE1),
          //               // Replace with your asset path
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }



  Widget _buildTravelCard(String title, String price) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(
              'assets/${title.toLowerCase().replaceAll(" ", "_")}.jpg'),
          // Replace with appropriate images
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "From $price",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverAppBarDelegate({required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        // buildAppBar(shrinkOffset,context),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: const TabBarWidget(),
        ),
      ],
    );
  }

  // double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  // double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  // Widget buildAppBar(double shrinkOffset, BuildContext context) =>
  //     AppBar(
  //       leading: IconButton(
  //         icon: const Icon(Icons.arrow_back),
  //         onPressed: () => Navigator.pop(context),
  //       ),
  //       title: const Text('Search Flights'),
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.menu),
  //           onPressed: () {},
  //         ),
  //       ],
  //     );

  Widget buildBackground(double shrinkOffset) =>
      Image.asset(
        Assets.BANNER1,
        fit: BoxFit.cover,
      );

  Widget buildFloating(double shrinkOffset, int index) =>
      Card(
        child: Row(
          children: [
            Expanded(child: buildButton(text: 'Round Trip')),
            Expanded(child: buildButton(text: 'One Way')),
            Expanded(child: buildButton(text: 'Multi-city')),
          ],
        ),
      );

  Widget buildButton({
    required String text,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
