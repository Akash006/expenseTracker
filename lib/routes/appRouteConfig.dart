import 'package:go_router/go_router.dart';
import 'package:expense_tracker/widgets/home.dart';
import 'package:expense_tracker/routes/appRouteConstants.dart';
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
    ],
  );
}
