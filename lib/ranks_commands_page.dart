import 'package:flutter/material.dart';
import 'package:ns_tracker/reusable_card.dart';
import 'saf_ranks.dart';
import 'constants.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        color: Colors.white54,
                        image: AssetImage(
                            "assets/SAF/SAF${(index * 2 + index + 1).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSAF[index * 2 + index],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        color: Colors.white54,
                        image: AssetImage(
                            "assets/SAF/SAF${(index * 2 + index + 2).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSAF[index * 2 + index + 1],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        color: Colors.white54,
                        image: AssetImage(
                            "assets/SAF/SAF${(index * 2 + index + 3).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSAF[index * 2 + index + 2],
                        style: kLabelTextStyle,
                      ),
                    ],
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

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200.0,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SPF/SPF${(index * 2 + index + 1).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSPF[index * 2 + index],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SPF/SPF${(index * 2 + index + 2).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSPF[index * 2 + index + 1],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SPF/SPF${(index * 2 + index + 3).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSPF[index * 2 + index + 2],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SCDF/SCDF${(index * 2 + index + 1).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSCDF[index * 2 + index],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SCDF/SCDF${(index * 2 + index + 2).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSCDF[index * 2 + index + 1],
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {},
                clickColor: kInactiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 100,
                        //color: Colors.white54,
                        image: AssetImage(
                            "assets/SCDF/SCDF${(index * 2 + index + 3).toString()}.png"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        rankNamesSCDF[index * 2 + index + 2],
                        style: kLabelTextStyle,
                      ),
                    ],
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

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
