import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:desktop_sidebar/features/home/widgets/create_new_task.dart';
import 'package:desktop_sidebar/features/home/widgets/hide_menu.dart';
import 'package:desktop_sidebar/features/home/widgets/margin.dart';
import 'package:desktop_sidebar/features/home/widgets/menu_header.dart';
import 'package:desktop_sidebar/features/home/widgets/menu_tile.dart';
import 'package:desktop_sidebar/features/home/widgets/menu_tile_trailing.dart';
import 'package:desktop_sidebar/features/home/widgets/profile_header.dart';
import 'package:desktop_sidebar/features/home/widgets/services_menu.dart';
import 'package:desktop_sidebar/features/home/widgets/settings_menu.dart';
import 'package:desktop_sidebar/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      onExit: (_) {
        Future.delayed(const Duration(milliseconds: 200),
            () => ref.read(isSideMenuCollapsed.notifier).state = true);
      },
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            children: [
              const ProfileHeader(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  height: 0,
                ),
              ),
              const MenuHeader(title: 'Menu', value: '6'),
              const ColSpacing(8),
              ...menuItems.map(
                (e) => MenuTile(
                  menu: e,
                  trailing: MenuTileTrailing(index: e.index),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  height: 0,
                ),
              ),
              const MenuHeader(title: 'Services', value: '3', hasEdit: true),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ServicesMenu(),
              ),
              const MenuHeader(
                title: 'Settings',
                value: '6',
                hasEdit: true,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SettingsMenu(),
              ),
              const CreateNewTask()
            ],
          ),
          const Positioned(
            right: 0,
            top: 40,
            child: HideMenu(),
          ),
        ],
      ),
    );
  }
}
