import 'package:flutter/widgets.dart';

class ColSpacing extends StatelessWidget {
  const ColSpacing(this._y, {super.key});

  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _y,
    );
  }
}

class RowSpacing extends StatelessWidget {
  const RowSpacing(this._y, {super.key});

  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _y,
    );
  }
}
