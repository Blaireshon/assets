import 'package:flutter/material.dart';

import 'assets.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('TabBar Example'),
        // ),
        body:  TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Align(
                alignment: Alignment.center,
                child: Text('Home',textAlign: TextAlign.center,)),
            Assets(),
            const Align(
                alignment: Alignment.center,
                child: Text('Trade',textAlign: TextAlign.center,)),
            const Align(
                alignment: Alignment.center,
                child: Text('Other book',textAlign: TextAlign.center,)),
            const Align(
                alignment: Alignment.center,
                child: Text('more',textAlign: TextAlign.center,)),

          ],
        ),
        bottomNavigationBar:Container(
          height: 70,
          padding: EdgeInsets.only(right: 24, left: 24),

          child: const TabBar(
            indicator: BoxDecoration(
              border: Border(top: BorderSide(width: 4.0,color: Color(0xffFCAF17))),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffFCAF17),  // 인디케이터 색상
            // indicatorWeight: 4, // 인디케이터 두께
            labelColor: Color(0xffFCAF17), //라벨 색상
            unselectedLabelColor: Color(0xffC6CBD0), //
            labelStyle: TextStyle(fontSize: 12), // 글씨 크기
            labelPadding: EdgeInsets.only(
              left: 0,
              right: 0,
            ),

            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 24,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.sort_by_alpha_rounded, size: 20),
                text: 'Assets',
              ),
              Tab(
                icon: Icon(
                  Icons.library_books,
                  size: 24,
                ),
                text: 'Trade',
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 24,
                ),
                text: 'Other book',
              ),
              Tab(
                icon:Icon(
                  Icons.more,
                  size:24,
                ),
                text:'more',
              )
            ],

          ),
        ),
      ),
    );
  }
}