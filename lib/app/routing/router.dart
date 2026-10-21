import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

import 'package:rick_n_morty/presentation/characters_list/screen/characters_list_screen.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    .named(
      'ContentList',
      (context, data) => CharactersListScreen(),
      initial: true,
      path: '/characters',
    ),
    CustomRoute(
      page: CharacterDetailsRoute.page,
      path: '/character/:id',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      duration: Duration(milliseconds: 200),
    ),
  ];
}
