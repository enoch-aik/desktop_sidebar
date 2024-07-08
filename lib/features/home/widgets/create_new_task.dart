import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:desktop_sidebar/features/home/widgets/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateNewTask extends ConsumerWidget {
  const CreateNewTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return isCollapsed
        ? const Column(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xff2F85FD),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              ColSpacing(36),
          ],
        )
        : Container(
            width: double.maxFinite,
            height: 148,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xff2F85FD),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                ColSpacing(8),
                Text('Create new task', style: TextStyle(fontSize: 14), maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Or use ',
                      ),
                      TextSpan(
                        text: 'invite link',
                        style: TextStyle(
                          color: Color(0xffe8a053),
                        ),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          );
  }
}
