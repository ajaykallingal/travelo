import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelo/presentation/pages/search_flight/flight_details_page.dart';
import 'package:travelo/presentation/pages/search_flight/flight_search_page.dart';
import 'package:travelo/presentation/pages/splash/splash_screen.dart';

import '../presentation/bloc/travel_destination/travel_destination_bloc.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
              path: 'search',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final TravelDestinationBloc bloc;

                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  child:  const FlightSearchScreen(),
                  transitionDuration: const Duration(milliseconds: 450),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.easeIn).animate(animation),
                      child: child,
                    );
                  },
                );
              },

          ),
          GoRoute(
            path: 'details',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const FlightSearchDetailsScreen(),
                transitionDuration: const Duration(milliseconds: 450),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity:
                    CurveTween(curve: Curves.easeIn).animate(animation),
                    child: child,
                  );
                },
              );
            },

          ),

        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const SplashScreen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
