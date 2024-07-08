import 'package:desktop_sidebar/features/home/widgets/stacked_images.dart';
import 'package:desktop_sidebar/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuTileTrailing extends StatelessWidget {
  final int index;

  const MenuTileTrailing({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return SvgPicture.asset(
          AppAssets.filter,
          width: 16,
        );
      case 2:
        return DecoratedBox(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.add, size: 16),
          ),
        );

      case 3: return const StackedImages();
      case 1 || 4 || 5:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
