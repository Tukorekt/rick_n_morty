// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:rick_n_morty/domain/entities/character.dart' as _i4;
import 'package:rick_n_morty/presentation/character_details/screen/character_details_screen.dart'
    as _i1;

/// generated route for
/// [_i1.CharacterDetailsScreen]
class CharacterDetailsRoute
    extends _i2.PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    _i3.Key? key,
    required _i4.Character character,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         CharacterDetailsRoute.name,
         args: CharacterDetailsRouteArgs(key: key, character: character),
         initialChildren: children,
       );

  static const String name = 'CharacterDetailsRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailsRouteArgs>();
      return _i1.CharacterDetailsScreen(
        key: args.key,
        character: args.character,
      );
    },
  );
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({this.key, required this.character});

  final _i3.Key? key;

  final _i4.Character character;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, character: $character}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterDetailsRouteArgs) return false;
    return key == other.key && character == other.character;
  }

  @override
  int get hashCode => key.hashCode ^ character.hashCode;
}
