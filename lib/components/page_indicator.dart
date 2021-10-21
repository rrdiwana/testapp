import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageIndiciator extends StatefulWidget {
  int totalNumberOfPages = 0;
  ValueNotifier<int> counter;

  PageIndiciator({
    required this.totalNumberOfPages,
    required this.counter,
  });

  @override
  State<PageIndiciator> createState() => PageIndicatorState(counter: counter);
}

class PageIndicatorState extends State<PageIndiciator>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<int> counter;
  PageIndicatorState({required this.counter});

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counter,
      builder: (context, value, child) => buildBottomPageIndicator(value),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildBottomPageIndicator(value) {
    return Container(
      margin: EdgeInsets.only(top: 250),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < widget.totalNumberOfPages; i++)
            if (i == value) ...[circleBar(true)] else circleBar(false),
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          image: isActive
              ? DecorationImage(
                  image: AssetImage('assets/graphics/cricket.png'))
              : DecorationImage(
                  image:
                      AssetImage('assets/graphics/cricket-grey-outlined.png')),
          // color: isActive ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(22))),
    );
  }
}
