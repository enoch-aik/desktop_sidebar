import 'package:desktop_sidebar/features/home/providers.dart';
import 'package:desktop_sidebar/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsMenu extends HookConsumerWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    final showFullSettings = useState(false);
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.maxFinite,
        //height: 200,
        padding: const EdgeInsets.all(8),
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
        child: isCollapsed
            ? SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: showFullSettings.value ? settings.length : 4,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == 3 && !showFullSettings.value) {
                        return InkWell(
                            onTap: () {
                              showFullSettings.value = !showFullSettings.value;
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff4F5670),
                            ));
                      }
                      return Container(
                        width: 28,
                        height: 28,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: index == 0 ? const Color(0xffE5EAED) : null,
                            borderRadius: BorderRadius.circular(6)),
                        child: SvgPicture.asset(
                          settings[index],
                          color: const Color(0xff4F5670),
                        ),
                      );
                    }),
              )
            :

        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...settings.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right:9.0),
                        child: Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color:
                                  e.key == 0 ? const Color(0xffE5EAED) : null,
                              borderRadius: BorderRadius.circular(6)),
                          child: SvgPicture.asset(
                            e.value,
                            color: const Color(0xff4F5670),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
        ),
        );
  }
}
