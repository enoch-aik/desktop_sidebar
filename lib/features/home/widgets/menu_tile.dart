import 'package:desktop_sidebar/features/home/models/menu_item.dart';
import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuTile extends ConsumerWidget {
  final MenuItemModel menu;
  final Widget? trailing;

  const MenuTile({super.key, required this.menu, this.trailing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(selectedMenuProvider);
    bool isCollapsed = ref.watch(isSideMenuCollapsed);

    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        selected: menu.index == selectedMenu,
        onTap: () {
          ref.read(selectedMenuProvider.notifier).state = menu.index;
        },
        selectedTileColor: const Color(0xff2E82FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: isCollapsed ? 24 : 8.0),
          child: SvgPicture.asset(menu.icon,
              color:
                  menu.index == selectedMenu ? const Color(0xffF8F4F5) : null),
        ),
        title: isCollapsed
            ? null
            : Text(
                menu.title,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
                style: TextStyle(
                    fontSize: 14,
                    color: menu.index == selectedMenu
                        ? const Color(0xffF8F4F5)
                        : null),
              ),
        trailing: isCollapsed
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: trailing,
              ),
      ),
    );
  }
}
