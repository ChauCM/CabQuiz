// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:cabquiz/features/home/views/pages/home_page.dart' as _i1;
import 'package:cabquiz/features/leaderboard/views/pages/leader_board_page.dart'
    as _i2;
import 'package:cabquiz/features/quiz/views/pages/quiz_page.dart' as _i3;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LeaderBoardPage]
class LeaderBoardRoute extends _i4.PageRouteInfo<void> {
  const LeaderBoardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LeaderBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeaderBoardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LeaderBoardPage();
    },
  );
}

/// generated route for
/// [_i3.QuizPage]
class QuizRoute extends _i4.PageRouteInfo<void> {
  const QuizRoute({List<_i4.PageRouteInfo>? children})
      : super(
          QuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.QuizPage();
    },
  );
}
