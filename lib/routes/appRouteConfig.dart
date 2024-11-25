import 'package:go_router/go_router.dart';
import 'package:expense_tracker/widgets/home.dart';
import 'package:expense_tracker/routes/appRouteConstants.dart';
import 'package:expense_tracker/views/transcationView.dart';
import '../views/addTranscations.dart';
import 'errorPage.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    // Only work if initialRoute is not defined
    errorBuilder: (context, state) => const Error404Screen(),
    routes: [
      GoRoute(
        name: MyAppRouteConstants.homeWidgetRouteName,
        path: '/',
        builder: (context, state) => HomeWidget(),
      ),
      GoRoute(
        name: MyAppRouteConstants.transactionViewRouteName,
        path: '/transactionView',
        builder: (context, state) => StickyHeaderWithList(),
      ),
      GoRoute(
        path: '/addtransaction/:type/:category',
        builder: (context, state) {
          final type = state.pathParameters['type']!;
          final category = state.pathParameters['category']!;
          return Addtranscations(type: type, category: category);
        },
      ),
    ],
  );
}
