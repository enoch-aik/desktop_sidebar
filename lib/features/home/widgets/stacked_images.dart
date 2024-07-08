import 'package:desktop_sidebar/features/home/widgets/margin.dart';
import 'package:desktop_sidebar/src/assets.dart';
import 'package:flutter/material.dart';

class StackedImages extends StatelessWidget {
  const StackedImages({super.key});

  @override
  Widget build(BuildContext context) {
    List imagesList = AppAssets.avatarList;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < imagesList.length; i++)
                Container(
                  margin: EdgeInsets.zero,
                  child: Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundImage: AssetImage(imagesList[i]),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const RowSpacing(8),
        Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5),
          child: const Center(
            child: Text(
              '4',
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
