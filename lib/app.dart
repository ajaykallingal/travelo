import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/domain/usecases/get_travel_destination.dart';
import 'package:travelo/domain/usecases/get_travel_inspirations.dart';
import 'package:travelo/presentation/bloc/search_flight_bloc/flight_bloc.dart';
import 'package:travelo/presentation/bloc/travel_destination/travel_destination_bloc.dart';
import 'package:travelo/presentation/bloc/travel_inspiration_bloc/travel_inspiration_bloc.dart';
import 'config/router.dart';
import 'constants/app_theme.dart';
import 'data/datasources/travel_destination_datasource.dart';
import 'data/datasources/travel_inspiration_datesource.dart';
import 'data/repositories/travel_destination_impl.dart';
import 'data/repositories/travel_inspiration_impl.dart';
import 'domain/repositories/destination_repository.dart';
import 'domain/repositories/travel_inspiration_repository.dart';

class App extends StatelessWidget {


  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TravelRepository>(
          create: (_) => TravelRepositoryImpl(TravelDummyDataSourceImpl()),
        ),
        RepositoryProvider<DestinationRepository>(
          create: (_) => DestinationRepositoryImpl(DestinationDummyDataSource()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TravelInspirationBloc>(
            create: (context) => TravelInspirationBloc(
              getTravelInspirations:
              GetTravelInspirations(context.read<TravelRepository>()),
            )..add(LoadTravelInspirations()),
          ),
          BlocProvider(create: (_) => FlightBloc()),

          // BlocProvider<TravelDestinationBloc>(
          //   create: (context) => TravelDestinationBloc(
          //     fetchDestinations:
          //     FetchDestinations(context.read<DestinationRepository>()),
          //   )..add(SearchDestinations("")),
          // ),
        ],
        child: MaterialApp.router(
          themeAnimationCurve: Curves.easeIn,
          themeAnimationDuration: const Duration(milliseconds: 450),
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationProvider:
          AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          debugShowCheckedModeBanner: false,
          title: 'Travelo',
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            // Obtain the current media query information.
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              // Set the default textScaleFactor to 0.85 for
              // the whole subtree.
              data: mediaQueryData.copyWith(
                  textScaler: const TextScaler.linear(0.85)),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
