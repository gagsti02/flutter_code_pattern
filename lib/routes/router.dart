import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: HomeRoute.page, children: [
          AutoRoute(page: DashboardRoute.page),
          AutoRoute(page: MyKitaRoute.page),
          AutoRoute(page: MySukiRoute.page),
          AutoRoute(page: ProfileRoute.page)
        ]),
      ];
}
