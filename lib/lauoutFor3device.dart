import 'package:flutter/cupertino.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 550;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 950;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 550 &&
        MediaQuery.of(context).size.width <= 950;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return largeScreen;
      } else if (constraints.maxWidth <= 950 && constraints.maxWidth >= 550) {
        return mediumScreen ?? largeScreen;
      } else{
        return smallScreen ?? largeScreen;
      }
    });
  }
}
