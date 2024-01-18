import 'package:go_router/go_router.dart';
import 'package:leute/view/page/main_page.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MainPage(),
  ),
]);
