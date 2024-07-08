import 'package:desktop_sidebar/features/home/widgets/margin.dart';
import 'package:desktop_sidebar/src/constants.dart';
import 'package:flutter/material.dart';

import 'services_tile.dart';

class ServicesMenu extends StatelessWidget {
  const ServicesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      //height: 200,
        //padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
      child: Column(
        children: [
          ...services.asMap().entries.map((e) => ServiceTile(service: e.value,isAdd: e.key==3,)),
          const ColSpacing(8),
        ],
      )
    );
  }
}
