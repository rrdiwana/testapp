import 'package:flutter/material.dart';
import 'package:testapp/components/page_indicator.dart';

class FootballCard extends StatefulWidget {
  @override
  State<FootballCard> createState() => _FootballCardState();
}

class _FootballCardState extends State<FootballCard> {
  /// total number of pages/cards
  final int _totalNumberOfMatches = 4;

  /// selected page
  late ValueNotifier<int> _counter;

  final PageController _pageController = PageController(
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    _counter = ValueNotifier<int>(0);
    super.initState();
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageIndiciator pageIndiciator = PageIndiciator(
      totalNumberOfPages: _totalNumberOfMatches,
      counter: _counter,
    );
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        buildContainerWithCards(),
        pageIndiciator,
      ],
    );
  }

  Widget buildContainerWithCards() {
    return Container(
      height: 250,
      child: buildPageViewForNormalCards(),
    );
  }

  Widget buildPageViewForNormalCards() {
    List<Widget> currentMatchesList =
        List<Widget>.filled(_totalNumberOfMatches, buildNormalCard());

    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: _totalNumberOfMatches,
      onPageChanged: (int pageNumber) {
        _counter.value =
            pageNumber; // increasing the value of counter to notify the pageindicator
      },
      itemBuilder: (context, index) {
        return currentMatchesList[index];
      },
    );
  }

  Widget buildNormalCard() {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      color: Colors.orangeAccent.shade100,
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: const SizedBox(
          child: Image(
            image: AssetImage('assets/graphics/cricket.png'),
          ),
        ),
      ),
    );
  }
}
