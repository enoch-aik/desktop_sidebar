import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<int> selectedMenuProvider = StateProvider<int>((ref) => 0);
final StateProvider<bool> isSideMenuCollapsed =
    StateProvider<bool>((ref) => false);
