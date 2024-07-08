import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HideMenu extends ConsumerWidget {
  const HideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return GestureDetector(
      onTap: () {
        ref.read(isSideMenuCollapsed.notifier).state = !isCollapsed;
      },
      child: Container(
          height: 50,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(-5, 0),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            firstChild: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            secondChild: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
            ),
            crossFadeState: isCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          )),
    );
  }
}
