import 'package:flutter/material.dart';
import '/screens/theme.dart';

class RoundedTopRightContainer extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  RoundedTopRightContainer(
      {super.key,
      required this.child,
      this.colors = const [Colors.white, Colors.white]});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: defaultMargin, left: defaultMargin, right: defaultMargin),
      padding: const EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
          boxShadow: [kShadow],
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: colors),
          borderRadius: kBorderRadius),
      child: child,
    );
  }
}
