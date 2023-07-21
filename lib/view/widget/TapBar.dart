// TbBar(Tabs),

// Expanded(
//   child: TabBarView(children: [
//     Center(child: Text('DOGS')),
//     Center(child: Text('CATS')),
//     Center(child: Text('BIRDS')),
//   ]),
// ),",Icons.account_circle,anyFunction,TbBar(Tabs)),



// var Tabs = [
//   (text: 'DOGS', icon: Icon(Icons.favorite)),
//   (text: 'CATS', icon: Icon(Icons.music_note)),
//   (text: 'BIRDS', icon: Icon(Icons.search)),
// ];


TabBar TbBar(myTabs) {
  return TabBar(
    isScrollable: true,
    tabs: [
      for (var tab in myTabs)
        Tab(
          text: tab.text,
          icon: tab.icon,
        ),
    ],
  );
}
