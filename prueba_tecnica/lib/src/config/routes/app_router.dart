import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica/src/view/pages.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage(
          child: const TabPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          });
    },
  ),
  GoRoute(
    path: '/transactions',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage(
          key: state.pageKey,
          child: const TransactionPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          });
    },
  ),
  GoRoute(
    path: '/my_transactions',
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage(
          key: state.pageKey,
          child: const MyTransactionsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          });
    },
  ),
]);
