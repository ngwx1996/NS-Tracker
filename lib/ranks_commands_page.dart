import 'package:flutter/material.dart';
import 'package:ns_tracker/constants.dart';
import 'package:ns_tracker/reusable_card.dart';
import 'rank_display.dart';

class RanksCommands extends StatefulWidget {
  @override
  _RanksCommandsState createState() => _RanksCommandsState();
}

class _RanksCommandsState extends State<RanksCommands>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Ranks / Commands'),
              pinned: true,
              floating: false,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'SAF'),
                  Tab(text: 'SPF'),
                  Tab(text: 'SCDF'),
                  Tab(text: 'CMD'),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            PageOne(),
            PageTwo(),
            PageThree(),
            PageFour(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200.0,
      itemCount: 11,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(3.0),
        child: RankDisplay(
            whichForce: 'SAF', index: index, insigniaColor: Colors.white54),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200.0,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(3.0),
        child: RankDisplay(
          whichForce: 'SPF',
          index: index,
          insigniaColor: null,
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200.0,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(3.0),
        child: RankDisplay(
          whichForce: 'SCDF',
          index: index,
          insigniaColor: null,
        ),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 100,
      itemCount: 25,
      itemBuilder: (context, index) => Container(
        child: ReusableCard(
          onPress: () {},
          clickColor: Color(0xFF1E1E1E),
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                malayCommands[index],
                style: index == 0 || index == 14
                    ? kCommandTitleTextStyle
                    : kLabelTextStyle,
              ),
              Visibility(
                child: Text(
                  englishCommand[index],
                  style: kCommandTextStyle,
                ),
                visible: index == 0 || index == 14 ? false : true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
