import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuHeader extends ConsumerWidget {
  final String title;
  final String value;
  final bool hasEdit;

  const MenuHeader(
      {super.key,
      required this.title,
      required this.value,
      this.hasEdit = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 260,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      color: Color(0xff57708E),
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(fontSize: 13),
            ),
            if (hasEdit && !isCollapsed) ...const [
             // Spacer(),
              Icon(
                Icons.edit,
                size: 16,
                color: Color(0xff57708E),
              )
            ]
          ],
        ),
      ),
    );
  }
}
